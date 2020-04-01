class BinarySearchTree
  def initialize
    @root = nil
    @length = 0
  end

  attr_reader :root, :length

  def insert(value)
    node = Node.new(value)

    if root
      parent_node, direction, status = find_parent_node(value)

      if status == :child_node_already_exists
        return puts("Node with value '#{value}' already exists.")
      end

      parent_node.public_send("#{direction}=".to_sym, node)
    else
      @root = node
    end

    @length += 1

    puts 'Node inserted.'

    node
  end

  def remove(value)
    parent_node, direction, status = find_parent_node(value) unless root.value == value

    if status == :child_node_does_not_exist
      return puts("Node with value '#{value}' does not exist.")
    end

    node = parent_node ? parent_node.public_send(direction) : root

    if node.left && node.right.nil?
      if root.value == value
        @root = node.left
      else
        parent_node.public_send("#{direction}=".to_sym, node.left)
      end
    elsif node.right && node.left.nil?
      if root.value == value
        @root = node.right
      else
        parent_node.public_send("#{direction}=".to_sym, node.right)
      end
    elsif node.left.nil? && node.right.nil?
      if root.value == value
        @root = nil
      else
        parent_node.public_send("#{direction}=".to_sym, nil)
      end
    else
      current_node = node.right

      parent_node_of_current_node = nil

      while current_node.left
        parent_node_of_current_node = current_node
        current_node = current_node.left
      end

      current_node.left = node.left

      if parent_node_of_current_node
        parent_node_of_current_node.left = current_node.right
        current_node.right = node.right
      end

      if root.value == value
        @root = current_node
      else
        parent_node.public_send("#{direction}=".to_sym, current_node)
      end
    end

    @length -= 1

    puts 'Node removed.'

    node
  end

  def lookup(value)
    parent_node, direction, status = find_parent_node(value) unless root.value == value

    return puts('Node not found.') if status == :child_node_does_not_exist

    puts 'Node found.'

    if parent_node
      parent_node.public_send(direction)
    else
      root
    end
  end

  private

  def find_parent_node(
    value, node = root, parent_node = nil, parent_node_direction = nil
  )
    if value < node.value
      if node.left
        find_parent_node(value, node.left, node, :left)
      else
        [node, :left, :child_node_does_not_exist]
      end
    elsif value > node.value
      if node.right
        find_parent_node(value, node.right, node, :right)
      else
        [node, :right, :child_node_does_not_exist]
      end
    else
      [parent_node, parent_node_direction, :child_node_already_exists]
    end
  end
end

class Node
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  attr_accessor :value, :left, :right
end
