class Stack
  def initialize
    @top = nil
    @bottom = nil
    @length = 0
  end

  attr_reader :length

  def peek
    top
  end

  def push(value)
    node = Node.new(value)

    if top
      node.next = top
      @top = node
    else
      @top = node
      @bottom = node
    end

    @length += 1

    puts 'Node pushed.'

    node
  end

  def pop
    return puts('Stack is empty.') if length < 1

    node = top

    @top = top.next

    @bottom = nil if length == 1

    @length -= 1

    puts 'Node popped.'

    node
  end

  private

  attr_reader :top, :bottom
end

class Node
  def initialize(value)
    @value = value
    @next = nil
  end

  attr_accessor :value, :next
end
