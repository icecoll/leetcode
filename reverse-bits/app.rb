# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  str = n.to_s(2)
  str = "0".concat(str) while str.size < 32
  str.reverse.to_i(2)
end
