class Game
  def initialize(init_grid)
    @init_grid = init_grid
    @next_grid = build_next_grid
  end

  def tick
    @init_grid.length.times do |i|
      if (alive?(i) && neighbours_alive?(i))
        set_alive(i)
      end
    end
    @next_grid
  end

  private 
  def build_next_grid
    Array.new(@init_grid.length) {[0]}
  end

  def alive?(i)
    @init_grid[i]  == [1]
  end

  def set_alive(i)
    @next_grid[i] = [1]
  end

  def neighbours_alive?(i)
    up_neighbour_alive?(i) && down_neighour_alive?(i)
  end

  def up_neighbour_alive?(i)
    i < (@init_grid.length - 1) && alive?(i+1)
  end
  
  def down_neighour_alive?(i)
    (i > 0) && alive?(i-1) 
  end
end
