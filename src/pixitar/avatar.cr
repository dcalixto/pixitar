module Pixitar
  class Avatar
    class InvalidGenderError < Exception; end

    class MissingImageFilesError < Exception; end

    getter image : Image
    getter assets_path : String
    getter image_extension : String
    getter gender : Symbol?

    def initialize(@image = Image.new, @assets_path = "public/assets/pixitar", @image_extension = "png")
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

    private def create_avatar_image(filename)
      face_parts.each do |face_part|
        asset = random_asset_for(face_part)
        image.compose(asset)
      end

      public_path = File.join("public", "images", "pixitar", filename)
      Dir.mkdir_p(File.dirname(public_path))
      image.save(public_path)

      "/images/pixitar/#{filename}"
    end

    private def random_asset_for(face_part)
      parts = assets_for(face_part)
      raise MissingImageFilesError.new("Missing #{face_part} image files for #{gender} avatars") if parts.empty?
      parts.sample
    end

    private def assets_for(face_part)
      pattern = File.join(assets_path, gender.to_s, "#{face_part}[0-9]*.#{image_extension}")
      puts "Debug - Looking for files at: #{pattern}"
      files = Dir.glob(pattern)
      puts "Debug - Found files: #{files.inspect}"
      files
    end
  end
end
