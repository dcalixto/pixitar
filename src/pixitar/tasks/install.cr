module Pixitar
  module Tasks
    def self.install
      base_path = "public/assets/pixitar"
      genders = ["male", "female"]
      parts = ["background", "clothes", "face", "hair", "mouth", "eye"]

      genders.each do |gender|
        parts.each do |part|
          dir_path = File.join(base_path, gender)
          Dir.mkdir_p(dir_path)
        end
      end
    end
  end
end
