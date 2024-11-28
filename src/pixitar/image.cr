require "stumpy_png"

module Pixitar
  class Image
    @canvas : StumpyPNG::Canvas

    def initialize
      @canvas = StumpyPNG::Canvas.new(500, 500) # Adjust size as needed
    end

    def compose(image_path : String)
      overlay = StumpyPNG.read(image_path)
      StumpyPNG.compose(@canvas, overlay, 0, 0)
      @canvas = overlay
    end

    def save(path : String)
      StumpyPNG.write(@canvas, path)
    end
  end
end
