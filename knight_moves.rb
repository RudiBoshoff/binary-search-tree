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
    for k in 0..1
      unless current_position[k].between?(1, 8) && target[k].between?(1, 8)
       exit
      end
    end
  end

  def valid_moves(current_position, valid_moves = [])
    moves = []
    moves << [(current_position[0] + 2), (current_position[1] + 1)]
    moves << [(current_position[0] + 2), (current_position[1] - 1)]
    moves << [(current_position[0] - 2), (current_position[1] + 1)]
    moves << [(current_position[0] - 2), (current_position[1] - 1)]
    moves << [(current_position[0] + 1), (current_position[1] + 2)]
    moves << [(current_position[0] - 1), (current_position[1] + 2)]
    moves << [(current_position[0] + 1), (current_position[1] - 2)]
    moves << [(current_position[0] - 1), (current_position[1] - 2)]

    moves.each do |move|
      valid_moves << move if @board.include?(move)
    end
    # print valid_moves
    valid_moves
  end

  def knight_move(current_position, target, route = [], queue = [], possible_moves = {})
    validate_input(current_position, target)
    @root = current_position if @root.nil?
    # hash is equal to all valid moves from current position
    possible_moves[current_position] = valid_moves(current_position)

    if possible_moves[current_position].include?(target)
      route << target
      knight_move(@root, current_position, route) until route.include?(@root)
      return "You made it in #{route.size - 1} moves! Here's your route: #{route.reverse}"
    else
      possible_moves.values.each { |value| value.each { |value| queue << value } }
      current_position = queue.shift
      knight_move(current_position, target, route, queue, possible_moves)
    end
  end
end

x = Knight.new
puts x.knight_move([8, 8], [1, 2])
