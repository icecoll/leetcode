require_relative "app"

RSpec.describe "#hamming_weight" do
  subject { hamming_weight(n) }

  context "11" do
    let(:n) { 11 }
    it { expect(subject).to eq(3) }
  end

  context "128" do
    let(:n) { 128 }
    it { expect(subject).to eq(1) }
  end
  # context "00000000000000000000000000001011" do
  #   let(:n) { 00000000000000000000000000001011 }
  #   it { expect(subject).to eq(3) }
  # end

  # context "00000000000000000000000010000000" do
  #   let(:n) { 00000000000000000000000010000000 }
  #   it { expect(subject).to eq(1) }
  # end

  # context "11111111111111111111111111111101" do
  #   let(:n) { 11111111111111111111111111111101 }
  #   it { expect(subject).to eq(31) }
  # end
end
