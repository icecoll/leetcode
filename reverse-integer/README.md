给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。
如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。
假设环境不允许存储 64 位整数（有符号或无符号）。

### 示例 1：
```
输入：x = 123
输出：321
```

### 示例 2：
```
输入：x = -123
输出：-321
```

### 示例 3：
```
输入：x = 120
输出：21
```

### 示例 4：
```
输入：x = 0
输出：0
```

### 提示：
- -231 <= x <= 231 - 1

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/reverse-integer

### 解题思路
ruby open class 给`Integer`加一个`reverse`方法，调`String#reverse`，注意处理处理负数和得到结果是否超过规定范围。
```
def reverse(x)
  x.reverse.invalid? ? 0 : x.reverse
end

class Integer
  def reverse
    (self < 0 ? "-#{abs.to_s.reverse}" : to_s.reverse).to_i
  end

  def invalid?
    self < -2**31 || self >= 2**31
  end
end
```