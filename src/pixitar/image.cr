require "stumpy_png"

module Pixitar
  class Image
    @canvas : StumpyPNG::Canvas

    def initialize(width = 400, height = 400)
      @canvas = StumpyCore::Canvas.new(width, height)
    end

    def compose(image_path)
      raise "File not found: #{image_path}" unless File.exists?(image_path)

      canvas = StumpyPNG.read(image_path)
      puts "Source image dimensions: #{canvas.width}x#{canvas.height}"
      puts "Target canvas dimensions: #{@canvas.width}x#{@canvas.height}"

      min_width = [canvas.width, @canvas.width].min
      min_height = [canvas.height, @canvas.height].min

      min_width.times do |x|
        min_height.times do |y|
          @canvas[x, y] = canvas[x, y]
        end
      end
    end

    def save(path : String)
      StumpyPNG.write(@canvas, path)
    end

    def width
      @canvas.width
    end

    def height
      @canvas.height
    end
  end
end
