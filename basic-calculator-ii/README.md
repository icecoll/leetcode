给你一个字符串表达式 s ，请你实现一个基本计算器来计算并返回它的值。
整数除法仅保留整数部分。

示例 1：
```
输入：s = "3+2*2"
输出：7
```

示例 2：
```
输入：s = " 3/2 "
输出：1
```

示例 3：
```
输入：s = " 3+5 / 2 "
输出：5
```

提示：
- 1 <= s.length <= 3 * 105
- 由整数和算符 ('+', '-', '*', '/') 组成，中间由一些空格隔开
- s 表示一个 有效表达式
- 表达式中的所有整数都是非负整数，且在范围 [0, 2^31 - 1] 内
- 题目数据保证答案是一个 32-bit 整数


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/basic-calculator-ii


```
# @param {String} s
# @return {Integer}
def calculate(s)
  Calculator.new(s).exec
end

class Calculator
  def initialize(expressions)
    @expressions = expressions.delete(" ")
  end

  def exec
    return @expressions.to_i if expressions_is_number?
    num1, op1, num2 = parse_number, parse_operator, parse_number

    while @expressions.length > 0
      op2, num3 = parse_operator, parse_number

      (num2 = calculate(num2, num3, op2)) && next if ["+", "-"].include?(op1) && ["/", "*"].include?(op2)
      num1, op1, num2 = calculate(num1, num2, op1), op2, num3
    end
    calculate(num1, num2, op1)
  end

  private

  def expressions_is_number?
    @expressions =~ /^\d*\d$/
  end

  def parse_number
    @expressions =~ /\d+/
    num, @expressions = $&.to_i, $'
    num
  end

  def parse_operator
    @expressions =~ /[+|\-*\/]/
    operator, @expressions = $&, $'
    operator
  end

  def calculate(n1, n2, opt)
    case opt
    when "+"
      n1 + n2
    when "-"
      n1 - n2
    when "*"
      n1 * n2
    when "/"
      n1 / n2
    end
  end
end
```