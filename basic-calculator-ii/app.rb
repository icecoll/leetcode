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
