# frozen_string_literal: true

require_relative "app"

RSpec.describe "#trap" do
  subject { trap(heights) }

  context "with heights: [0,1,0,2,1,0,1,3,2,1,2,1]" do
    let(:heights) { [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1] }
    it { expect(subject).to eq(6) }
  end

  context "with heights: [1,7,5]" do
    let(:heights) { [1, 7, 5] }
    it { expect(subject).to eq(0) }
  end
end
