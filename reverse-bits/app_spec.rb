require_relative "app"

RSpec.describe "#reverse_bits" do
  subject { reverse_bits(a) }

  context "43261596" do
    let(:a) { 43261596 }
    it { expect(subject).to eq(964176192) }
  end

  context "4294967293" do
    let(:a) { 4294967293 }
    it { expect(subject).to eq(3221225471) }
  end
end
