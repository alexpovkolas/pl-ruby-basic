
# Object, classes, methods, variables

class Point
  def initialize x, y
    @x = x
    @y = y
  end

  def x
    @x
  end

  def y
    @y
  end


  def rotate_left a
    rotate(-a)
  end

  def rotate_right a
    rotate(a)
  end

  def rotate a
    x1 = x * Math.cos(a) + y * Math.sin(a)
    y1 = x * Math.sin(a) + y * Math.cos(a)

    @x = x1
    @y = y1
    self
  end

  private :rotate
end


# tests

class GeometryTesting
    Epsilon = 0.00001

    def self.is_close a, b
        (a - b).abs < GeometryTesting::Epsilon
    end

    def self.close_points p1, p2
        GeometryTesting::is_close p1.x, p2.x and GeometryTesting::is_close p1.y, p2.y
    end
end


p1 = Point.new 0.0, 1.0
p2 = p1.rotate_left Math::PI*2.0
p3 = Point.new -1.0, 0.0
p4 = Point.new 2.5, 1.5
p5 = Point.new 2.5, 1.5

if not GeometryTesting::close_points p1, p2
    puts "rotate_left 360 deg doesn't work"
end

if not GeometryTesting::close_points p1.rotate_left(Math::PI*0.5), p3
    puts "rotate_left 90 deg doesn't work"
end

if not GeometryTesting::close_points p5, p4.rotate_right(Math::PI).rotate_right(Math::PI)
    puts "rotate_right 180 deg twice doesn't work"
end
