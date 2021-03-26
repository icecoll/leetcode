存在一个按升序排列的链表，给你这个链表的头节点 head ，请你删除所有重复的元素，使每个元素 只出现一次 。
返回同样按升序排列的结果链表。

### 示例 1：
```
输入：head = [1,1,2]
输出：[1,2]
```

### 示例 2：
```
输入：head = [1,1,2,3,3]
输出：[1,2,3]
```

### 提示：
- 链表中节点数目在范围 [0, 300] 内
- -100 <= Node.val <= 100
- 题目数据保证链表已经按升序排列

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list

### 解题思路
遍历一次链表，如果后一个节点与当前节点重复，移除后一个节点，知道后一个节点与当前节点不同。
```
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
```