require "file_utils"

module Pixitar
  module Tasks
    def self.install
      shard_assets = File.expand_path(File.join(File.dirname(File.dirname(File.dirname(__DIR__))), "public/assets/pixitar"))
      app_assets = File.expand_path(File.join(Dir.current, "public/assets/pixitar"))

      puts "Installing Pixitar assets..."
      puts "Source path: #{shard_assets} (exists? #{File.exists?(shard_assets)})"
      puts "Target path: #{app_assets}"

      # Ensure target directory exists
      Dir.mkdir_p(app_assets)

      if File.exists?(shard_assets)
        puts "Copying assets..."
        FileUtils.cp_r("#{shard_assets}/.", app_assets)
        puts "Assets copied successfully!"
      else
        puts "ERROR: Source assets not found!"
      end
    end
  end
end
