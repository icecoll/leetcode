require_relative "app"

RSpec.describe "Integer#reverse" do
  it { expect(123.reverse).to eq(321) }
  it { expect(-123.reverse).to eq(-321) }
  it { expect(120.reverse).to eq(21) }
  it { expect(0.reverse).to eq(0) }
  it { expect(reverse(1147483648)).to eq(0) }
end
