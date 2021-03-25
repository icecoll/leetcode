# @param {Integer} n, a positive integer
# # @return {Integer}
def hamming_weight(n)
  n.to_s(2).count("1")
end

# def hamming_weight(n)
#   start_with_0?(n) ? n.to_s(8).count('1') : n.to_s.count("1")
# end

# def start_with_0?(n)
#   n.to_s.count('01') != n.to_s.size
# end
