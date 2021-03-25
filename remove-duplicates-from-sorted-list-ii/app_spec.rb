require_relative "app"

RSpec.describe "#delete_duplicates" do
  let(:array) { [] }
  let(:head) { SinglyLinkedList.build(array) }
  subject { delete_duplicates(head) }

  context "[1,2,3,3,4,4,5]" do
    let(:array) { [1, 2, 3, 3, 4, 4, 5] }
    it { expect(subject.list_values).to eq([1, 2, 5]) }
  end

  context "[1,1,1,2,3]" do
    let(:array) { [1, 1, 1, 2, 3] }
    it { expect(subject.list_values).to eq([2, 3]) }
  end

  context "[]" do
    let(:array) { [] }
    it { expect(subject).to be_nil }
  end

  context "[1, 1]" do
    let(:array) { [1, 1] }
    it { expect(subject).to be_nil }
  end

  context "[1,2,2]" do
    let(:array) { [1, 2, 2] }
    it { expect(subject.list_values).to eq([1]) }
  end

  context "[1,1,2,2]" do
    let(:array) { [1, 1, 2, 2] }
    it { expect(subject).to be_nil }
  end
end
