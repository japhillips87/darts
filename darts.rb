class Darts
  PI = 3.14159

  def self.get_theta x, y
    raise 'unknown theta for 0,0' if x == 0 && y == 0
    if x == 0
      y > 0 ? 90 : 270
    elsif y == 0
      x > 0 ? 0 : 180
    else
      Math.atan(y/x) * (180/PI)
    end
  end

  def self.distance_from_bullseye x, y
    Math.sqrt(x*x + y*y)
  end

  def self.slice(theta)
    offset = (theta + 9) / 18
    [6, 13, 4][offset]
  end
end
