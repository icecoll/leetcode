编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：
- 每行中的整数从左到右按升序排列。
- 每行的第一个整数大于前一行的最后一个整数。

### 示例 1：
```
输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
输出：true
```

### 示例 2：
```
输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
输出：false
```

### 提示：
- m == matrix.length
- n == matrix[i].length
- 1 <= m, n <= 100
- -104 <= matrix[i][j], target <= 104

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/search-a-2d-matrix

### 解题思路
不需要给出位置，那就直接遍历一次数组，判断最后一个值与`target`的大小，如果`target`比最后一个值大，那从下一组中找，否则在当前组找，找到则返回true，找不到就跳到下组，直到所有组都找过。
代码：
```
def search_matrix(matrix, target)
  matrix.each do |arr|
    next if target > arr.last
    next if !arr.include?(target)
    return true
  end
  false
end
```

结果：
```
执行用时：56 ms, 在所有 Ruby 提交中击败了100.00%的用户
内存消耗：204.9 MB, 在所有 Ruby 提交中击败了100.00%的用户
```


