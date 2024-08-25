module Pixitar
  class Avatar
    class InvalidGenderError < StandardError; end
    class MissingImageFilesError < StandardError; end

    attr_reader :image
    attr_reader :assets_path
    attr_reader :image_extension
    attr_reader :gender


    def initialize(image_class = Pixitar::Image.new, opts = {})
  @image = image_class.is_a?(Hash) ? Pixitar::Image.new : image_class
  @assets_path = opts.fetch(:assets_path, Rails.root.join("app", "assets", "images", "pixitar"))
  @image_extension = opts.fetch(:image_extension, "png")
    end


    def face_parts
      [
        :background,
        :clothes,
        :face,
        :hair,
        :mouth,
        :eye
      ]
    end

    def genders
      [
        :male,
        :female
      ]
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

   # def generate_avatar(gender = random_gender, filename = "avatar.png")
     # @gender = gender
     # raise InvalidGenderError unless genders.include?(gender)

     # create_avatar_image(filename)
    #end

    def generate_avatar(gender = random_gender, filename = nil)
  @gender = gender
  raise InvalidGenderError unless genders.include?(gender)

  # Generate a random filename with a short identifier and random number
  identifier = ("a".."z").to_a.sample(4).join # Generates a 4-character random string
  random_number = rand(1000..9999) # Generates a 4-digit random number
  filename ||= "avatar_#{identifier}_#{random_number}.png"

  create_avatar_image(filename)
end

    private

    
#def create_avatar_image(filename)
 # face_parts.each do |face_part|
 #   asset = random_asset_for(face_part)
 #   image.compose(asset)
 # end
#  image.save(filename)
  
  # Return the file path as a string
#  File.join(assets_path, filename)
#end

    
def create_avatar_image(filename)
  face_parts.each do |face_part|
    asset = random_asset_for(face_part)
    image.compose(asset)
  end
  # Save the image to the public directory
  public_path = File.join(Rails.root, "public", "images", "pixitar", filename)
  image.save(public_path)
  
  # Return the public URL path
  "/images/pixitar/#{filename}"
end



    def random_asset_for(face_part)
      parts = assets_for(face_part)
      raise MissingImageFilesError, "Missing #{face_part} image files for #{gender} avatars" if parts.empty?

      parts.sample
    end

    def assets_for(face_part)
      pattern = File.join(assets_path, gender.to_s, "#{face_part}[0-9]*.#{image_extension}")
      puts "Searching for files with pattern: #{pattern}"  # Debugging line
      Dir.glob(pattern)
    end

    def path
      File.join(assets_path, gender.to_s, "*.#{image_extension}")
    end
  end
end
