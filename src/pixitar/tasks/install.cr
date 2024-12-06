module Pixitar
  module Tasks
    def self.install
      # Get absolute paths
      source = File.expand_path(File.join(Dir.current, "..", "pixitar/public/assets/pixitar"))
      target = File.join(Dir.current, "public/assets/pixitar")

      puts "Installing Pixitar assets..."
      puts "From: #{source}"
      puts "To: #{target}"

      # Create target directory
      Dir.mkdir_p(target)

      if File.exists?(source)
        puts "Copying assets..."
        system("cp -r #{source}/* #{target}/")
        puts "✓ Assets installed successfully!"
        puts "Verifying installation..."
        puts "Files copied: #{Dir.entries(target).join(", ")}"
      else
        puts "✗ Error: Source assets not found at #{source}"
      end
    end
  end
end
