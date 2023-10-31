require_relative 'app'

RSpec.describe 'add_two_numbers' do
  subject { add_two_numbers(l1, l2) }
  context 'l1 = [2,4,3], l2 = [5,6,4]' do
    let(:l1) { ListNode.init_from_array([2, 4, 3]) }
    let(:l2) { ListNode.init_from_array([5, 6, 4]) }
    it { expect(subject).to eq([7, 0, 8]) }
  end

  context 'l1 =[9,9,9,9,9,9,9], l2 = [9,9,9,9]' do
    let(:l1) { ListNode.init_from_array([9,9,9,9,9,9,9]) }
    let(:l2) { ListNode.init_from_array([9,9,9,9]) }
    it { expect(subject).to eq([8,9,9,9,0,0,0,1]) }
  end

  context 'l1 =[0], l2 = [0]' do
    let(:l1) { ListNode.init_from_array([0]) }
    let(:l2) { ListNode.init_from_array([0]) }
    it { expect(subject).to eq([0]) }
  end
end
