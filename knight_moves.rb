class Knight
  attr_reader :board

  def initialize
    create_board
    @root = nil
  end

  def create_board
    @board = []
    (1..8).to_a.each do |x|
      (1..8).to_a.each do |y|
        @board << [x, y]
      end
    end
  end

  def validate_input(current_position, target)
    (0..1).each do |k|
      exit unless current_position[k].between?(1, 8) && target[k].between?(1, 8)
    end
  end

  def valid_moves(current_position)
    available_moves = []
    available_moves << [(current_position[0] + 2), (current_position[1] + 1)]
    available_moves << [(current_position[0] + 2), (current_position[1] - 1)]
    available_moves << [(current_position[0] - 2), (current_position[1] + 1)]
    available_moves << [(current_position[0] - 2), (current_position[1] - 1)]
    available_moves << [(current_position[0] + 1), (current_position[1] + 2)]
    available_moves << [(current_position[0] - 1), (current_position[1] + 2)]
    available_moves << [(current_position[0] + 1), (current_position[1] - 2)]
    available_moves << [(current_position[0] - 1), (current_position[1] - 2)]

    @valid_moves = []
    available_moves.each do |move|
      @valid_moves << move if @board.include?(move)
    end
    @valid_moves
  end

  def knight_move(current_position, target, route = [], queue = [])
    validate_input(current_position, target)
    @root = current_position if @root.nil?
    # hash is equal to all valid moves from current position
    if valid_moves(current_position).include?(target)
      route.unshift(target)

      knight_move(@root, current_position, route) until route.include?(@root)
      return "You made it in #{route.size - 1} moves! Here's your route: #{route}"
    else
      @valid_moves.each do |value|
        queue << value
      end
      current_position = queue.shift # returns first elements then removes it
      knight_move(current_position, target, route, queue)
    end
  end
end

x = Knight.new
puts x.knight_move([1, 1], [8, 8])
