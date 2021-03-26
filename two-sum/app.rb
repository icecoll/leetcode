# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums.each_with_index do |num, idx|
    next unless nums.slice(idx + 1, num.size).include?(target - num)
    return [idx, nums.rindex(target - num)]
  end
end
