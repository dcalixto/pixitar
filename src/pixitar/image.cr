require "stumpy_png"

module Pixitar
  class Image
    @canvas : StumpyPNG::Canvas

    def initialize(width = 400, height = 400)
      @canvas = StumpyCore::Canvas.new(width, height)
    end

    def compose(image_path)
      puts "Composing #{image_path}..."
      overlay = StumpyPNG.read(image_path)
      # puts "Overlay dimensions: #{overlay.width}x#{overlay.height}"

      width.times do |x|
        height.times do |y|
          # Get the overlay pixel
          overlay_pixel = overlay[x, y]

          # Only copy non-transparent pixels (alpha > 0)
          if overlay_pixel.alpha > 0
            @canvas[x, y] = overlay_pixel
          end
        end
      end

      puts "Finished composing #{image_path}."
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
