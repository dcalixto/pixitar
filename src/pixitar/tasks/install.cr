require "file_utils"

module Pixitar
  module Tasks
    def self.install
      target = File.join(Dir.current, "public/assets/pixitar")
      source = File.expand_path("../pixitar/public/assets/pixitar")

      # Create target directory
      Dir.mkdir_p(target)

      # Copy assets
      if File.exists?(source)
        system("cp -r #{source}/* #{target}/")
      end
    end
  end
end
