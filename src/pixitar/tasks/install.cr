module Pixitar
  module Tasks
    def self.install
      puts "Current directory: #{Dir.current}"
      puts "File location: #{__FILE__}"

      source = File.join(File.dirname(File.dirname(File.dirname(__DIR__))), "public/assets/pixitar")
      target = File.join(Dir.current, "public/assets/pixitar")

      puts "Source path: #{source}"
      puts "Source exists? #{File.exists?(source)}"
      puts "Target path: #{target}"

      Dir.mkdir_p(target)

      if File.exists?(source)
        system("cp -r #{source}/* #{target}/")
        puts "Files copied: #{Dir.entries(target).join(", ")}"
      end
    end
  end
end
