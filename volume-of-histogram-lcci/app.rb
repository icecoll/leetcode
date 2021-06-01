# frozen_string_literal: true

# Histogram
class Histogram
  def initialize(heights)
    @heights = heights
  end

  def volume
    return 0 if @heights.size <= 2

    vol = 0
    position = @heights.index(&:positive?) || 0
    new_position = next_position(position)
    while position < @heights.size && new_position && @heights.at(new_position).positive?
      vol += volume_between(position, new_position)
      position = new_position
      new_position = next_position(new_position)
    end

    vol
  end

  private

  def next_position(position)
    return if position >= @heights.size - 1

    target_position = position + 1
    @heights.each_with_index do |_h, idx|
      next if idx < target_position
      return idx if @heights.at(idx) > @heights.at(position)

      target_position = idx if @heights.at(idx) > @heights.at(target_position)
    end
    target_position
  end

  def volume_between(position1, position2)
    height = [@heights.at(position1), @heights.at(position2)].min
    width = position2 - position1 - 1
    vol = height * width
    @heights[(position1 + 1)..(position2 - 1)].each { |h| vol -= h }
    puts "vol between #{position1}, #{position2}: #{vol}"
    vol
  end
end

# @param {Integer[]} height
# @return {Integer}
def trap(height)
  Histogram.new(height).volume
end
