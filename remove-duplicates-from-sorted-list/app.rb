# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
  list = SinglyLinkedList.new(head)
  list.remove_duplicates
  list.head
end

class SinglyLinkedList
  attr_accessor :head

  def initialize(head)
    @head = head
  end

  def remove_duplicates
    return nil if @head.nil?

    current_node = @head
    while current_node&.next
      current_node.remove_next_nodes while current_node.duplicate_with_next?
      current_node = current_node.next
    end
  end

  def to_array
    @head.list_values
  end

  def self.build(array)
    return nil if array.empty?
    array.reverse.reduce(nil) { |head, val| ListNode.new(val, head) }
  end
end

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, next_node = nil)
    @val = val
    @next = next_node
  end

  def list_values
    return [val] if @next.nil?
    [val, *@next.list_values]
  end

  def duplicate_with_next?
    @val == @next&.val
  end

  def remove_next_nodes
    @next = @next.next
  end
end
