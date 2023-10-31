class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def self.init_from_array(arr)
    return if arr.empty?

    head = ListNode.new(arr.first)
    current_node = head

    arr.each_with_index do |ar, idx|
      next if idx.zero?
      current_node.next = ListNode.new(ar)
      current_node = current_node.next
    end

    head
  end

  def self.to_i(node)
    ListNode.to_s(node).reverse.to_i
  end

  def self.to_s(node)
    current_node = node
    text = ''
    while current_node
      text += current_node.val.to_s
      current_node = current_node.next
    end
    text
  end
end

def add_two_numbers(l1, l2)
  num1 = ListNode.to_i(l1)
  num2 = ListNode.to_i(l2)

  (num1 + num2).to_s.reverse.chars.map(&:to_i)
end
