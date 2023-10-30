#### 原题链接
https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/

#### 解题思路
直接用ruby中的uniq方法去重
```
def remove_duplicates(nums)
  nums.uniq!
  nums.length
end
```