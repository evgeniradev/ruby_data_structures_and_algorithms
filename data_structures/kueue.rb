class Kueue
  def initialize
    @first = nil
    @last = nil
    @length = 0
  end

  attr_reader :length

  def peek
    first
  end

  def enqueue(value)
    node = Node.new(value)

    if last
      last.next = node
    else
      @first = node
    end

    @last = node

    @length += 1

    puts 'Node enqueued.'

    node
  end

  def dequeue
    return puts('Queue is empty.') if length.zero?

    node = @first

    @last = nil if length == 1

    @first = node.next

    @length -= 1

    puts 'Node dequeued.'

    node
  end

  private

  attr_reader :first, :last
end

class Node
  def initialize(value)
    @value = value
    @next = nil
  end

  attr_accessor :value, :next
end
