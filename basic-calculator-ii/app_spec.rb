require_relative "app"

RSpec.describe "#calculate" do
  let(:expressions) { "" }
  subject { Calculator.new(expressions).exec }

  context "when the expressions is a number" do
    let(:expressions) { "1234" }
    it { expect(subject).to eq(1234) }
  end

  context "3+2*2" do
    let(:expressions) { "3+2*2" }
    it { expect(subject).to eq(7) }
  end

  context " 3/2 " do
    let(:expressions) { " 3/2 " }
    it { expect(subject).to eq(1) }
  end

  context " 3+5 / 2 " do
    let(:expressions) { " 3+5 / 2 " }
    it { expect(subject).to eq(5) }
  end

  context "3*2+1" do
    let(:expressions) { "3*2+1" }
    it { expect(subject).to eq(7) }
  end

  context "0 - 0" do
    let(:expressions) { "0-0" }
    it { expect(subject).to eq(0) }
  end

  context "1+1-1" do
    let(:expressions) { "1+1-1" }
    it { expect(subject).to eq(1) }
  end

  context "1-1+1" do
    let(:expressions) { "1-1+1" }
    it { expect(subject).to eq(1) }
  end

  context "1-1-1" do
    let(:expressions) { "1-1-1" }
    it { expect(subject).to eq(-1) }
  end

  context "1*2+3*4" do
    let(:expressions) { "1*2+3*4" }
    it { expect(subject).to eq(14) }
  end

  context "1*2-3/4+5*6-7*8+9/10" do
    let(:expressions) { "1*2-3/4+5*6-7*8+9/10" }
    it { expect(subject).to eq(-24) }
  end
end
