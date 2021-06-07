# frozen_string_literal: true

# @param {Integer[]} candies_count
# @param {Integer[][]} queries
# @return {Boolean[]}
def can_eat(candies_count, queries)
  game = CandyGame.new(candies_count)
  queries.map { |q| game.satisfied?(q[0], q[1], q[2]) }
end

class CandyGame
  def initialize(candies)
    @candies = candies
    @sums = calculate_sum
  end

  def satisfied?(favorite_type, favorite_day, daily_cap)
    return favorite_day < @candies[favorite_type] if favorite_type.zero?

    max_days = @sums[favorite_type] - 1
    min_days = (@sums[favorite_type - 1] * 1.0 / daily_cap).floor - 1
    min_days < favorite_day && max_days >= favorite_day
  end

  def calculate_sum
    return [] if @candies.empty?
    arr = Array.new(@candies.count)
    @candies.each_with_index do |candy_count, idx|
      arr[idx] = idx.zero? ? @candies[0] : (arr[idx - 1] + @candies[idx])
    end
    arr
  end
end
