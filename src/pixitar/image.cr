require "stumpy_png"

module Pixitar
  class Image
    @canvas : StumpyPNG::Canvas

    def initialize
      @canvas = StumpyPNG::Canvas.new(500, 500)
    end

    def compose(overlay_path)
      overlay = StumpyPNG.read(overlay_path)
      width.times do |x|
        height.times do |y|
          @canvas[x, y] = overlay[x, y]
        end
      end
    end

    def save(path : String)
      StumpyPNG.write(@canvas, path)
    end
  end
end
