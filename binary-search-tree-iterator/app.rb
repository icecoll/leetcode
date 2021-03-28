# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
class BSTIterator
  def initialize(root)
    @root = root
    @list = root.to_list
  end

  def next
    @list.next
  end

  def has_next
    @list.head ? true : false
  end
end

class SinglyLinkedList
  attr_accessor :head, :tail

  def initialize(head, tail)
    @head, @tail = head, tail
  end

  def next
    return if @head.nil?
    val = @head.val
    @head = @head.next
    val
  end
end

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, next_node = nil)
    @val = val
    @next = next_node
  end
end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  def to_list
    current_node = ListNode.new(@val, nil)
    return SinglyLinkedList.new(current_node, current_node) if @left.nil? && @right.nil?
    if @left.nil?
      right_list = @right.to_list
      current_node.next = right_list.head
      right_list.head = current_node
      return right_list
    end

    if @right.nil?
      left_list = @left.to_list
      left_list.tail.next = current_node
      left_list.tail = current_node
      return left_list
    end

    left_list = @left.to_list
    right_list = @right.to_list
    left_list.tail.next = current_node
    current_node.next = right_list.head
    left_list.tail = right_list.tail
    left_list
  end
end
# Your BSTIterator object will be instantiated and called as such:
# obj = BSTIterator.new(root)
# param_1 = obj.next()
# param_2 = obj.has_next()
