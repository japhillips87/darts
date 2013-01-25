class Darts
  PI = 3.14159
  RADIUSES = [0.5, 1.25, 4.025, 4.2, 6.525, 6.7]
  SLICES = [6, 13, 4, 18, 1, 20, 5, 12, 9, 14, 11, 8, 16, 7, 19, 3, 17, 2, 15, 10]
  attr_accessor :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def get_theta
    raise 'unknown theta for 0,0' if x == 0 && y == 0
    if x == 0
      y > 0 ? 90 : 270
    elsif y == 0
      x > 0 ? 0 : 180
    else
      Math.atan(y/x) * (180/PI)
    end
  end

  def distance_from_bullseye
    Math.sqrt(x*x + y*y)
  end

  def slice
    offset = ((theta + 9) % 360) / 18
    SLICES[offset]
  end

  def ring
    RADIUSES.each_with_index do |radius, index|
      return index + 1 if radius >= distance
    end
  end
end
