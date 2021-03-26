require_relative "app"

RSpec.describe "two_sum" do
  subject { two_sum(nums, target) }

  context "nums = [3,2,4], target = 6" do
    let(:nums) { [3, 2, 4] }
    let(:target) { 6 }
    it { expect(subject).to eq([1, 2]) }
  end

  context "nums = [3,3], target = 6" do
    let(:nums) { [3, 3] }
    let(:target) { 6 }
    it { expect(subject).to eq([0, 1]) }
  end

  context "nums = [-1,-2,-3,-4,-5], target = -8" do
    let(:nums) { [-1, -2, -3, -4, -5] }
    let(:target) { -8 }
    it { expect(subject).to eq([2, 4]) }
  end
end
