实现一个二叉搜索树迭代器类BSTIterator ，表示一个按中序遍历二叉搜索树（BST）的迭代器：
BSTIterator(TreeNode root) 初始化 BSTIterator 类的一个对象。BST 的根节点 root 会作为构造函数的一部分给出。指针应初始化为一个不存在于 BST 中的数字，且该数字小于 BST 中的任何元素。
boolean hasNext() 如果向指针右侧遍历存在数字，则返回 true ；否则返回 false 。
int next()将指针向右移动，然后返回指针处的数字。
注意，指针初始化为一个不存在于 BST 中的数字，所以对 next() 的首次调用将返回 BST 中的最小元素。
你可以假设 next() 调用总是有效的，也就是说，当调用 next() 时，BST 的中序遍历中至少存在一个下一个数字。

### 示例：
```
输入
["BSTIterator", "next", "next", "hasNext", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
[[[7, 3, 15, null, null, 9, 20]], [], [], [], [], [], [], [], [], []]
输出
[null, 3, 7, true, 9, true, 15, true, 20, false]

解释
BSTIterator bSTIterator = new BSTIterator([7, 3, 15, null, null, 9, 20]);
bSTIterator.next();    // 返回 3
bSTIterator.next();    // 返回 7
bSTIterator.hasNext(); // 返回 True
bSTIterator.next();    // 返回 9
bSTIterator.hasNext(); // 返回 True
bSTIterator.next();    // 返回 15
bSTIterator.hasNext(); // 返回 True
bSTIterator.next();    // 返回 20
bSTIterator.hasNext(); // 返回 False
```

### 提示：

- 树中节点的数目在范围 [1, 105] 内
- 0 <= Node.val <= 106
- 最多调用 105 次 hasNext 和 next 操作

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/binary-search-tree-iterator

### 解题思路
对二叉树做一次变量，把二叉树转换成链表，为了把链表连起来，需要在递归是将尾结点向上传递。得到链表后调next就变成把头结点向后移，hasNext就是判断头结点是否为空。
```
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
```