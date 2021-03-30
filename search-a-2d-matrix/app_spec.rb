require_relative "app"

RSpec.describe "search_matrix" do
  subject { search_matrix(matrix, target) }

  context "输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3" do
    let(:matrix) { [[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 60]] }
    let(:target) { 3 }
    it { expect(subject).to be_truthy }
  end
end
