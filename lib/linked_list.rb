require_relative './node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

 

  def nth_from_end(n)
    return nil if @head.nil? || n <= 0

    fast_pointer = @head
    slow_pointer = @head
    count = 0

    # Move the fast pointer 'n' steps ahead
    while count < n
      return nil if fast_pointer.nil?  # The list has fewer than 'n' nodes
      fast_pointer = fast_pointer.next_node
      count += 1
    end

    while fast_pointer&.next_node
      fast_pointer = fast_pointer.next_node
      slow_pointer = slow_pointer.next_node
    end

    # The slow pointer is now pointing to the nth node from the end
    slow_pointer&.value
  end
  
  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current = @head
      while current.next_node
        current = current.next_node
      end
      current.next_node = Node.new(value)
    end
  end



end
