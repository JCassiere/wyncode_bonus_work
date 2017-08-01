class AdjacencyMatrix
  attr_reader :matrix, :num_vertexes

  def initialize(num_vertexes)
    @num_vertexes = num_vertexes
    @matrix = []
    num_vertexes.times do |i|
      inner_array = []
      num_vertexes.times do |j|
        inner_array << 0
      end
      @matrix << inner_array
    end
  end

  def add_vertex()
    @matrix.each_index do |ind|
      @matrix[ind] += [0]
    end
    @num_vertexes += 1
    @matrix << Array.new(@num_vertexes, 0)
  end

  def remove_vertex(ind=@num_vertexes-1)
    @matrix.each_index do |matrix_ind|
      @matrix[matrix_ind].delete_at(ind)
    end
    @matrix.delete_at(ind)
    @num_vertexes -= 1
  end

  def add_edge(x, y, dir=false)
    @matrix[y][x] = 1
    unless dir
      @matrix[x][y] = 1
    end
  end

  def adjacent?(x, y)
    @matrix[y][x] == 1 || @matrix[x][y] == 1
  end

  def neighbors(x)
    neighbors = []
    @matrix[x].each_index do |ind|
      if @matrix[x][ind] == 1 || @matrix[ind][x] == 1
        neighbors << ind
      end
    end
    neighbors
  end

  def remove_edge(x, y, dir=false)
    @matrix[y][x] = 0
    unless dir
      @matrix[x][y] = 0
    end
  end

end