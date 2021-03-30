# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  matrix.each do |arr|
    next if target > arr.last
    next unless arr.include?(target)
    return true
  end
  false
end
