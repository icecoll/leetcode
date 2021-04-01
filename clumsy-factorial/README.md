通常，正整数 n 的阶乘是所有小于或等于 n 的正整数的乘积。例如，factorial(10) = 10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1。
相反，我们设计了一个笨阶乘 clumsy：在整数的递减序列中，我们以一个固定顺序的操作符序列来依次替换原有的乘法操作符：乘法(*)，除法(/)，加法(+)和减法(-)。
例如，clumsy(10) = 10 * 9 / 8 + 7 - 6 * 5 / 4 + 3 - 2 * 1。然而，这些运算仍然使用通常的算术运算顺序：我们在任何加、减步骤之前执行所有的乘法和除法步骤，并且按从左到右处理乘法和除法步骤。
另外，我们使用的除法是地板除法（floor division），所以 10 * 9 / 8 等于 11。这保证结果是一个整数。
实现上面定义的笨函数：给定一个整数 N，它返回 N 的笨阶乘。

### 示例 1：
```
输入：4
输出：7
解释：7 = 4 * 3 / 2 + 1
```

### 示例 2：
```
输入：10
输出：12
解释：12 = 10 * 9 / 8 + 7 - 6 * 5 / 4 + 3 - 2 * 1
```

### 提示：
- 1 <= N <= 10000
- -2^31 <= answer <= 2^31 - 1  （答案保证符合 32 位整数。）

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/clumsy-factorial

### 解题思路
之前做过一个计算机，可以把n先转成表达式，用计算器算就可以了。官方有一个数学解法，可以去看看。
```

def clumsy(n)
  exps = build_clumsy_expressions(n)
  Calculator.new(exps).exec
end

def build_clumsy_expressions(n)
  operators = %w[* / + -]
  counter = 0
  n.downto(1).reduce("") do |exp, num|
    if num == n
      exp << num.to_s
    else
      exp << "#{operators[counter % 4]}#{num}"
      counter += 1
    end
    exp
  end
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