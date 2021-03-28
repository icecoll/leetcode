require_relative "app"

RSpec.describe "BSTIterator" do
  let(:node1) { TreeNode.new(3, nil, nil) }
  let(:node2) { TreeNode.new(9, nil, nil) }
  let(:node3) { TreeNode.new(20, nil, nil) }
  let(:node4) { TreeNode.new(15, node2, node3) }
  let(:node5) { TreeNode.new(7, node1, node4) }
  let(:bSTIterator) { BSTIterator.new(node5) }

  it "return correct value" do
    expect(bSTIterator.next).to eq(3)
    expect(bSTIterator.next).to eq(7)
    expect(bSTIterator.has_next).to be_truthy
    expect(bSTIterator.next).to eq(9)
    expect(bSTIterator.has_next).to be_truthy
    expect(bSTIterator.next).to eq(15)
    expect(bSTIterator.has_next).to be_truthy
    expect(bSTIterator.next).to eq(20)
    expect(bSTIterator.has_next).to be_falsy
  end
end
