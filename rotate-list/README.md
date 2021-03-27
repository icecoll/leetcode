给你一个链表的头节点 head ，旋转链表，将链表每个节点向右移动 k 个位置。

### 示例 1：
```
输入：head = [1,2,3,4,5], k = 2
输出：[4,5,1,2,3]
```

### 示例 2：
```
输入：head = [0,1,2], k = 4
输出：[2,0,1]
```

### 提示：

- 链表中节点的数目在范围 [0, 500] 内
- -100 <= Node.val <= 100
- 0 <= k <= 2 * 109

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/rotate-list

### 解题思路
1. 计算出链表的长度，同时用一个数组把链表的节点存起来，方便后面根据位置查找；
2. 计算新的头结点位置：`size - ( k / size )`;
3. 新头节点的前一个节点指向空，原尾节点指向原头结点；
4. 一些边界条件处理，比如头结点为空，只有一个节点等。
```
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
```