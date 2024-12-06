module Pixitar
  module Tasks
    def self.install
      # Get shard's assets path
      shard_assets = File.join(File.dirname(File.dirname(File.dirname(__DIR__))), "public/assets/pixitar")

      # Get user's application assets path
      app_assets = File.join(Dir.current, "public/assets/pixitar")

      puts "Installing Pixitar assets..."
      puts "From: #{shard_assets}"
      puts "To: #{app_assets}"

      # Create directories
      Dir.mkdir_p(app_assets)

      # Copy assets if they don't exist
      if File.exists?(shard_assets)
        system("cp -r #{shard_assets}/* #{app_assets}/") unless Dir.entries(app_assets).size > 2
        puts "Assets installed successfully!"
      else
        puts "Warning: Could not find source assets at #{shard_assets}"
      end
    end
  end
end
