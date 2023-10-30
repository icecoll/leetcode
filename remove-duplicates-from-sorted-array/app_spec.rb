require_relative 'app'

RSpec.describe '#remove_duplicates' do
  let(:nums) { [] }
  context 'nums = [1,1,2]' do
    let(:nums) { [1, 1, 2] }
    it { expect(remove_duplicates(nums)).to eq(2) }
  end
end
