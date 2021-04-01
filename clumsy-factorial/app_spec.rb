require_relative "app"

RSpec.describe "#clumsy" do
  subject { clumsy(n) }

  context "4" do
    let(:n) { 4 }
    it { expect(subject).to eq(7) }
  end

  context "10" do
    let(:n) { 10 }
    it { expect(subject).to eq(12) }
  end
end
