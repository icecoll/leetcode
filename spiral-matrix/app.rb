# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  Matrix.new(matrix).spiralling
end

class Matrix
  def initialize(matrix)
    @matrix = matrix
    @row = matrix.size
    @column = matrix.first.size
    @size = @row * @column
    @edge = Edge.new(0, @column - 1, @row - 1, 0)
    @steps = 0
  end

  def spiralling
    point = Point.new(0, 0)
    move_right(point)
  end

  def move_right(point)
    return [] if @steps >= @size
    if point.y == @edge.right
      @edge.top += 1
      go_down(point)
    else
      value = value_at(point)
      point.step_to("right")
      [value, *move_right(point)]
    end
  end

  def go_down(point)
    return [] if @steps >= @size
    if point.x == @edge.bottom
      @edge.right -= 1
      move_left(point)
    else
      value = value_at(point)
      point.step_to("bottom")
      [value, *go_down(point)]
    end
  end

  def move_left(point)
    return [] if @steps >= @size
    if point.y == @edge.left
      @edge.bottom -= 1
      go_up(point)
    else
      value = value_at(point)
      point.step_to("left")
      [value, *move_left(point)]
    end
  end

  def go_up(point)
    return [] if @steps >= @size
    if point.x == @edge.top
      @edge.left += 1
      move_right(point)
    else
      value = value_at(point)
      point.step_to("top")
      [value, *go_up(point)]
    end
  end

  def value_at(point)
    @steps += 1
    puts "#{point.x}, #{point.y}. steps: #{@steps}, edge: #{[@edge.top, @edge.right, @edge.bottom, @edge.left]}"
    @matrix[point.x][point.y]
  end

  class Point
    attr_accessor :x, :y

    def initialize(x, y)
      @x, @y = x, y
    end

    def step_to(direction)
      case direction
      when "top"
        @x -= 1
      when "right"
        @y += 1
      when "bottom"
        @x += 1
      when "left"
        @y -= 1
      end
    end
  end

  class Edge
    attr_accessor :top, :right, :bottom, :left

    def initialize(top, right, bottom, left)
      @top, @right, @bottom, @left = top, right, bottom, left
    end
  end
end
