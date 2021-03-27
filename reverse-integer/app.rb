# @param {Integer} x
# @return {Integer}
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
