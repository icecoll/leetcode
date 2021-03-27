# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  SinglyLinkedList.new(head).rotate(k)
end

class SinglyLinkedList
  attr_accessor :head, :size

  def initialize(head)
    @head = head
    @node_array = []
    @size = calculate_size
  end

  # 如果要多次调用，调用后需要重新计算node_array
  def rotate(step)
    step %= @size unless @size.zero?
    return @head if @head.nil? || step.zero? || @size == 1
    new_head_idx = @size - (step % @size) # 计算头结点位置
    new_head = @node_array.at(new_head_idx)
    @node_array[@size - 1].next = @head # 尾节点链接头结点
    @head = new_head # 赋值新的头结点
    @node_array[new_head_idx - 1].next = nil # 新的尾结点
    @head
  end

  def calculate_size
    return @size unless @size.nil?
    counter = 0
    node = @head
    while node
      @node_array[counter] = node
      counter += 1
      node = node.next
    end
    counter
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
end
