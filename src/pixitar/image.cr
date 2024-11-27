module Pixitar
  class Image
    getter canvas : StumpyPNG::Canvas

    def initialize(@height = 400, @width = 400)
      @canvas = StumpyPNG::Canvas.new(@width, @height)
    end

    def compose(filename)
      overlay = StumpyPNG.read(filename)
      StumpyPNG.compose!(@canvas, overlay, 0, 0)
    end

    def save(filename)
      StumpyPNG.write(@canvas, filename)
    end
  end
end
