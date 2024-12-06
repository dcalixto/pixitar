module Pixitar
  module Tasks
    def self.install
      begin
        # Debug current location
        puts "Current directory: #{Dir.current}"

        # Define paths
        shard_assets = File.join(__DIR__, "..", "..", "..", "public/assets/pixitar")
        app_assets = File.join(Dir.current, "public/assets/pixitar")

        puts "Installing Pixitar assets..."
        puts "From: #{shard_assets}"
        puts "To: #{app_assets}"

        # Create target directory
        Dir.mkdir_p(app_assets)

        # Copy assets
        if File.exists?(shard_assets)
          system("cp -r #{shard_assets}/* #{app_assets}/")
          puts "✓ Assets installed successfully!"
        else
          puts "✗ Error: Source assets not found at #{shard_assets}"
        end
      rescue ex
        puts "✗ Installation failed: #{ex.message}"
      end
    end
  end
end
