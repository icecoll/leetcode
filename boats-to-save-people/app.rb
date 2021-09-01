# @param {Integer[]} people
# @param {Integer} limit
# @return {Integer}
def num_rescue_boats(people, limit)
  result, p1, p2 = 0, 0, people.count - 1

  people.sort!
  while p1 <= p2
    if p1 == p2
      result += 1
      break
    end

    p1 += 1 if people[p1] + people[p2] <= limit
    result += 1
    p2 -= 1
  end
  result
end
