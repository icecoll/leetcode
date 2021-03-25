存在一个按升序排列的链表，给你这个链表的头节点 head ，请你删除链表中所有存在数字重复情况的节点，只保留原始链表中 没有重复出现 的数字。
返回同样按升序排列的结果链表。
 
### 示例 1：
```
输入：head = [1,2,3,3,4,4,5]
输出：[1,2,5]
```

### 示例 2：
```
输入：head = [1,1,1,2,3]
输出：[2,3]
```

### 提示：
- 链表中节点数目在范围 [0, 300] 内
- -100 <= Node.val <= 100
- 题目数据保证链表已经按升序排列

来源：力扣（LeetCode
链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii

### 解题思路
1. 可以先遍历整个链表，得到一个数组，把重复的元素找出来，然后再一次遍历链表，如果当前节点是重复节点，则移除；
2. 遍历一次链表，因为是有序，所以只要判断两种情况：
- 当前节点与下一个节点重复，移动到下一个不重复的节点；
- 当前节点与下一个节点不重复，但是下一个节点与后面的节点重复，找出不重复的节点，将当前节点的next指向该节点。
采用第二种方法，注意一些边界条件，代码：
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

    @head = @head.next_non_duplicate_node if @head.duplicate_with_next?
    return nil if @head.nil?

    current_node = @head
    while current_node&.next&.next
      current_node.remove_next_duplicate_nodes while current_node.should_remove_next?
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
    return false if @next.nil?
    @val == @next.val
  end

  def should_remove_next?
    @next&.duplicate_with_next?
  end

  def remove_next_duplicate_nodes
    @next = @next.next_non_duplicate_node
  end

  def next_non_duplicate_node
    node = @next
    node = node.next while @val == node&.val
    return nil if node.nil?
    node.duplicate_with_next? ? node.next_non_duplicate_node : node
  end
end

```