require_relative "app"

RSpec.describe MyHashMap do
  let(:hash_map) { described_class.new }

  describe "#put" do
    subject { hash_map.put(1, 2) }

    it { expect(subject).to be_nil }
  end

  describe "#get" do
    before do
      hash_map.put(1, 2)
    end

    it { expect(hash_map.get(1)).to eq(2) }
    it { expect(hash_map.get(3)).to eq(-1) }
  end

  describe "#remove" do
    before do
      hash_map.put(1, 2)
    end

    it { expect(hash_map.remove(1)).to be_nil }
  end
end
