class Darts
  RADIUSES = [0.5, 1.25, 4.025, 4.2, 6.525, 6.7]
  SLICES = [6, 13, 4, 18, 1, 20, 5, 12, 9, 14, 11, 8, 16, 7, 19, 3, 17, 2, 15, 10]
  attr_accessor :x, :y, :theta, :distance

  def initialize x, y
    @x = x
    @y = y
    @theta = get_theta
    @distance = distance_from_bullseye
  end

  def score
    return 50 if theta == 'bullseye'
    case ring
    when 1
      50
    when 2
      25
    when 4
      slice * 3
    when 6
      slice * 2
    else
      slice
    end
  end

  def get_theta
    return 'bullseye' if x == 0 && y == 0
    if x == 0
      y > 0 ? 90 : 270
    elsif y == 0
      x > 0 ? 0 : 180
    else
      Math.atan(y/x) * (180/Math::PI)
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
