class LinkedList
  require_relative './node'

  def initialize
    @first_node = nil
    @last_node = nil
  end

  def append(value)
    if @first_node.nil?
      @first_node = Node.new(value)
      @last_node = @first_node
    else
      @last_node.next_node = Node.new(value)
      @last_node = @last_node.next_node
    end
  end

  def prepend(value)
    if @first_node.nil?
      @first_node = Node.new(value)
      @last_node = Node.new(value)
    else
      temp = Node.new(value)
      temp.next_node = @first_node
      @first_node = temp
    end
  end

  def size
    return 0 unless @first_node

    current_node = @first_node
    counter = 1
    while current_node.next_node
      counter += 1
      current_node = current_node.next_node
    end
    counter
  end

  def head
    @first_node.value
  end

  def tail
    @last_node.value
  end

  def at(index)
    return nil unless @first_node

    current_node = @first_node
    counter = 0

    until counter == index
      return nil unless current_node.next_node

      current_node = current_node.next_node
      counter += 1
    end
    current_node.value
  end

  def pop
    current_node = @first_node
    last_node = @last_node

    current_node = current_node.next_node until current_node.next_node == @last_node
    current_node.next_node = nil
    @last_node = current_node
    last_node
  end

  def contains?(value)
    current_node = @first_node
    while current_node
      return true if current_node.value == value

      current_node = current_node.next_node
    end

    false
  end

  def find(value)
    current_node = @first_node
    counter = 0
    while current_node
      return counter if current_node.value == value

      counter += 1
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    current_node = @first_node
    string = ''
    while current_node
      string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string += 'nil'
    string
  end
end

list = LinkedList.new
list.append(2)
list.prepend(1)
list.append(3)
list.append(4)
p list.size
p list
p list.head
p list.tail
p list.at(2)
p list.pop
p list.contains?(5)
p list.find(5)
p list.to_s