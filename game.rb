class Game
  def initialize(init_grid)
    @init_grid = init_grid
    @next_grid = build_next_grid
  end

  def tick
    @y_length.times do |y|
      @x_length.times do |x|
        set_alive(x,y) if should_live?(x,y)
      end
    end
    @next_grid
  end

  private 
  def build_next_grid
    @y_length = @init_grid.length
    @x_length = @init_grid[0].length
    Array.new(@y_length) {[0] * @x_length}
  end

  def set_alive(x,y)
    @next_grid[y][x] = 1
  end

  def should_live?(x,y)
    alive_neighbours_count = alive_neighbours_count(x,y)
    if alive?(x,y)
      case
      when (0..1).include?(alive_neighbours_count)
        false
      when (2..3).include?(alive_neighbours_count)
        true
      when (4..8).include?(alive_neighbours_count)
        false
      end
    elsif alive_neighbours_count == 3
      true
    else
      false
    end
  end

  def alive_neighbours_count(x,y)
    neighbours = 
      [[x-1,y-1], [x,y-1], [x+1,y-1],
       [x-1,y],            [x+1,y],
       [x-1,y+1], [x,y+1], [x+1,y+1]]

    alive_count = 0
    neighbours.each do |neighbour|
      if (alive?(neighbour[0], neighbour[1]))
        alive_count += 1
      end
    end
    alive_count
  end

  def alive?(x,y)
    return false if (x > @x_length - 1 || x < 0)
    return false if (y > @y_length - 1 || y < 0)
    @init_grid[y][x] == 1
  end
end
=begin
[
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
]
=end
