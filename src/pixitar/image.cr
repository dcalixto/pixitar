require "stumpy_png"

module Pixitar
  class Image
    @canvas : StumpyPNG::Canvas

    def initialize
      @canvas = StumpyPNG::Canvas.new(500, 500)
    end

    def compose(image_path : String)
      overlay = StumpyPNG.read(image_path)
      # Use the correct method for compositing images in StumpyPNG
      @canvas.pixels.each_with_index do |pixel, index|
        @canvas[index] = overlay[index]
      end
    end

    def save(path : String)
      StumpyPNG.write(@canvas, path)
    end
  end
end
