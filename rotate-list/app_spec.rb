require_relative "app"

RSpec.describe "#rotate_right" do
  let(:array) { [] }
  let(:step) { 0 }
  let(:head) { SinglyLinkedList.build(array) }
  subject { rotate_right(head, step) }

  context "[1,2,3,4,5] by step 2" do
    let(:array) { [1, 2, 3, 4, 5] }
    let(:step) { 2 }
    it { expect(subject.list_values).to eq([4, 5, 1, 2, 3]) }
  end

  context "[] by step 2" do
    let(:array) { [] }
    let(:step) { 2 }
    it { expect(subject).to be_nil }
  end

  context "[1,2,3,4,5] by step 0" do
    let(:array) { [1, 2, 3, 4, 5] }
    let(:step) { 0 }
    it { expect(subject.list_values).to eq([1, 2, 3, 4, 5]) }
  end

  context "[0,1,2] by step 4" do
    let(:array) { [0, 1, 2] }
    let(:step) { 4 }
    it { expect(subject.list_values).to eq([2, 0, 1]) }
  end

  context "[1] by step 1" do
    let(:array) { [1] }
    let(:step) { 1 }
    it { expect(subject.list_values).to eq([1]) }
  end

  context "[1,2] by step 1" do
    let(:array) { [1, 2] }
    let(:step) { 1 }
    it { expect(subject.list_values).to eq([2, 1]) }
  end

  context "[1,2] by step 2" do
    let(:array) { [1, 2] }
    let(:step) { 2 }
    it { expect(subject.list_values).to eq([1, 2]) }
  end
end
