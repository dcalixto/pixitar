require "stumpy_png"

module Pixitar
  class Image
    @canvas : StumpyPNG::Canvas

    def initialize(width = 400, height = 400)
      @canvas = StumpyCore::Canvas.new(width, height)
    end
    def compose(image_path)
      canvas = StumpyPNG.read(image_path)
      width.times do |x|
        height.times do |y|
          @canvas[x, y] = canvas[x, y]
        end
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
