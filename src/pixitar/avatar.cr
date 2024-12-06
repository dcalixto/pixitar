module Pixitar
  class Avatar
    class InvalidGenderError < Exception; end

    class MissingImageFilesError < Exception; end

    getter image : Image
    getter assets_path : String
    getter image_extension : String
    getter gender : Symbol?

    def initialize(
      @image = Image.new,
      @assets_path = File.join(Dir.current, "public/assets/pixitar"),
      @image_extension = "png"
    )
      puts "Assets path: #{@assets_path}"
      puts "Assets exist: #{File.exists?(@assets_path)}"
    end

    private def find_assets_path
      paths = [
        File.join(Dir.current, "public/assets/pixitar"),
        File.join(File.dirname(File.dirname(__DIR__)), "public/assets/pixitar"),
      ]

      paths.find { |path| File.exists?(path) } || paths.first
    end

    def face_parts
      [:background, :clothes, :face, :hair, :mouth, :eye]
    end

    def genders
      [:male, :female]
    end

    def random_gender
      genders.sample
    end

    def male_avatar
      generate_avatar(:male)
    end

    def female_avatar
      generate_avatar(:female)
    end

    def generate_avatar(gender = random_gender, filename = nil)
      @gender = gender
      raise InvalidGenderError.new unless genders.includes?(gender)

      identifier = ('a'..'z').to_a.sample(4).join
      random_number = Random.new.rand(1000..9999)
      filename ||= "avatar_#{identifier}_#{random_number}.png"

      create_avatar_image(filename)
    end

    def create_avatar_image(filename)
      face_parts.each do |face_part|
        asset = random_asset_for(face_part)
        puts "Debug - Composing #{face_part} from: #{asset}"
        image.compose(asset)
      end

      public_path = File.join("public", "images", "pixitar", filename)
      puts "Debug - Saving final image to: #{public_path}"
      Dir.mkdir_p(File.dirname(public_path))
      image.save(public_path)
      puts "Debug - Image saved successfully"

      "/images/pixitar/#{filename}"
    end

    def random_asset_for(face_part)
      parts = assets_for(face_part)
      raise MissingImageFilesError.new("Missing #{face_part} image files for #{gender} avatars") if parts.empty?
      parts.sample
    end

    def assets_for(face_part)
      abs_path = File.expand_path(@assets_path) # Ensure absolute path
      pattern = File.join(abs_path, gender.to_s, "#{face_part}[0-9]*.#{image_extension}")
      # puts "Debug - Looking for files at: #{pattern}" # Debug
      files = Dir.glob(pattern)
      # puts "Debug - Found files: #{files.inspect}" # Debug
      files
    end
  end
end
