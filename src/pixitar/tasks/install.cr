module Pixitar
  module Tasks
    def self.install
      # Source from local development path
      source = File.expand_path("../pixitar/public/assets/pixitar")
      target = File.join(Dir.current, "public/assets/pixitar")

      puts "Installing Pixitar assets..."
      puts "From: #{source}"
      puts "To: #{target}"

      Dir.mkdir_p(target)

      if File.exists?(source)
        system("cp -r #{source}/* #{target}/")
        puts "✓ Assets installed successfully!"
      end
    end
  end
end
