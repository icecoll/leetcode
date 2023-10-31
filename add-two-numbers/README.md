给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
请你将两个数相加，并以相同形式返回一个表示和的链表。
你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

### 示例 1：
```
输入：l1 = [2,4,3], l2 = [5,6,4]
输出：[7,0,8]
解释：342 + 465 = 807.
```

### 示例 2：
```
输入：l1 = [0], l2 = [0]
输出：[0]
```

### 示例 3：
```
输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
输出：[8,9,9,9,0,0,0,1]
```

提示：
每个链表中的节点数在范围 [1, 100] 内
0 <= Node.val <= 9
题目数据保证列表表示的数字不含前导零

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/add-two-numbers/

### 解题思路
将所给的数据转为整数相加, 再转回数组

```
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
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
```