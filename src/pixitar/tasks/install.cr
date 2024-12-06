module Pixitar
  module Tasks
    def self.install
      # Debug current location
      puts "Current directory: #{Dir.current}"

      # Get paths with expanded paths for debugging
      shard_assets = File.expand_path(File.join(File.dirname(File.dirname(File.dirname(__DIR__))), "public/assets/pixitar"))
      app_assets = File.expand_path(File.join(Dir.current, "public/assets/pixitar"))

      puts "Installing Pixitar assets..."
      puts "Source path: #{shard_assets}"
      puts "Source exists? #{File.exists?(shard_assets)}"
      puts "Target path: #{app_assets}"

      # Create directories
      Dir.mkdir_p(app_assets)

      if File.exists?(shard_assets)
        puts "Copying assets..."
        system("cp -r #{shard_assets}/* #{app_assets}/")
        puts "Assets copied: #{Dir.entries(app_assets).join(", ")}"
      else
        puts "ERROR: Source assets not found!"
      end
    end
  end
end
