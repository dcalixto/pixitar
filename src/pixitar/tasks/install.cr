module Pixitar
  module Tasks
    def self.install
      # Get absolute paths
      current_dir = File.dirname(__FILE__)
      shard_root = File.expand_path(File.join(current_dir, "..", "..", ".."))

      shard_assets = File.join(shard_root, "public/assets/pixitar")
      app_assets = File.join(Dir.current, "public/assets/pixitar")

      puts "Debug info:"
      puts "Current dir: #{current_dir}"
      puts "Shard root: #{shard_root}"
      puts "Source assets: #{shard_assets}"
      puts "Target assets: #{app_assets}"

      Dir.mkdir_p(app_assets)

      if File.exists?(shard_assets)
        system("cp -r #{shard_assets}/* #{app_assets}/")
      end
    end
  end
end
