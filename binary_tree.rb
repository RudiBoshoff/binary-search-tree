class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BST
  def initialize
    @root = nil
  end

  def build_tree(data)
    data.each do |item|
      node = Node.new(item)
      if @root.nil?
        @root = node
        # puts 'root: '
        @root.value.to_s
      else
        print item.to_s + " "
        place_node(@root, item)
      end
    end
  end

  def place_node(node, item)
    if item >= node.value
      if node.right
        # puts 'right'
        place_node(node.right, item)
      else
        # puts 'new right'
        node.right = Node.new(item)
      end
    else
      if node.left
        # puts 'left'
        place_node(node.left, item)
      else
        # puts 'new left'
        node.left = Node.new(item)
      end
    end
  end

  def breadth_first_search(target)
    @root = node if @root.nil?
    queue = [@root]
    # puts "Search path:"
    until queue.empty?
      current_node = queue.shift
      puts current_node.value
      return puts "located #{current_node.value}" if current_node.value == target

      queue << current_node.left unless current_node.left.nil?
      queue << current_node.right unless current_node.right.nil?
    end
    nil
    # puts "node not found"
  end

  def depth_first_search(target)
    return if @root.nil?
    stack = [@root]
    # puts "Search path:"
    until stack.empty?
      current_node = stack.shift
      return puts "located #{current_node.value}" if current_node.value == target
        stack.unshift(current_node.left) unless current_node.left.nil?
        stack.unshift(current_node.right) unless current_node.right.nil?
    end
    nil
    # puts "node not found"
  end

  def dfs_rec(target, current_node = @root)
    return if @root.nil?
    return puts "located #{current_node.value}" if current_node.value == target
    dfs_rec(target, current_node.left) unless current_node.left.nil?
    dfs_rec(target, current_node.right) unless current_node.right.nil?
  end
end

# bst = BST.new
# puts "binary tree:"
# bst.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# puts "\n"
# bst.breadth_first_search(1)
# puts "\n"
# bst.depth_first_search(23)
# puts "\n"
# bst.dfs_rec(16)
