require_relative "app"

RSpec.describe "all_paths_source_target" do
  subject { all_paths_source_target(graph) }

  context "[[1,2],[3],[3],[]]" do
    let(:graph) { [[1, 2], [3], [3], []] }

    it { expect(subject).to eq([[0, 1, 3], [0, 2, 3]]) }
  end

  context "[[4,3,1],[3,2,4],[3],[4],[]]" do
    let(:graph) { [[4, 3, 1], [3, 2, 4], [3], [4], []] }

    it { expect(subject).to eq([[0, 4], [0, 3, 4], [0, 1, 3, 4], [0, 1, 2, 3, 4], [0, 1, 4]]) }
  end

  context "[[4,3,1],[3,2,4],[],[4],[]]" do
    let(:graph) { [[4, 3, 1], [3, 2, 4], [], [4], []] }

    it { expect(subject).to eq([[0, 4], [0, 3, 4], [0, 1, 3, 4], [0, 1, 4]]) }
  end

  context "[[2],[],[1]]" do
    let(:graph) { [[2], [], [1]] }

    it { expect(subject).to eq([[0, 2]]) }
  end
end
