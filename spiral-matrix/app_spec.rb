require_relative "app"

RSpec.describe "#spiral_order" do
  let(:matrix) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
  subject { spiral_order(matrix) }
  it { expect(subject).to eq([1, 2, 3, 6, 9, 8, 7, 4, 5]) }

  context "[[1,2,3,4],[5,6,7,8],[9,10,11,12]]" do
    let(:matrix) { [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]] }
    it { expect(subject).to eq([1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]) }
  end

  context "[[3],[2]]" do
    let(:matrix) { [[3], [2]] }
    it { expect(subject).to eq([3, 2]) }
  end

  context "[[1,2,3,4,5,6,7,8,9,10],[11,12,13,14,15,16,17,18,19,20]]" do
    let(:matrix) { [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]] }
    it { expect(subject).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11]) }
  end
end
