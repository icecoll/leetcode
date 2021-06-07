require_relative "app"

RSpec.describe "#can_eat" do
  subject { can_eat(candies, queries) }

  context "when candiesis [7,4,5,3,8] and quries is [[0,2,2],[4,2,4],[2,13,1000000000]]" do
    let(:candies) { [7, 4, 5, 3, 8] }
    let(:queries) { [[0, 2, 2], [4, 2, 4], [2, 13, 1000000000]] }
    it { expect(subject).to eq([true, false, true]) }
  end

  context "when candiesis [5,2,6,4,1] and quries is [[3,1,2],[4,10,3],[3,10,100],[4,100,30],[1,3,1]]" do
    let(:candies) { [5, 2, 6, 4, 1] }
    let(:queries) { [[3, 1, 2], [4, 10, 3], [3, 10, 100], [4, 100, 30], [1, 3, 1]] }
    it { expect(subject).to eq([false, true, true, false, false]) }
  end

  context "condition 3" do
    let(:candies) { [16, 38, 8, 41, 30, 31, 14, 45, 3, 2, 24, 23, 38, 30, 31, 17, 35, 4, 9, 42, 28, 18, 37, 18, 14, 46, 11, 13, 19, 3, 5, 39, 24, 48, 20, 29, 4, 19, 36, 11, 28, 49, 38, 16, 23, 24, 4, 22, 29, 35, 45, 38, 37, 40, 2, 37, 8, 41, 33, 8, 40, 27, 13, 4, 33, 5, 8, 14, 19, 35, 31, 8, 8] }
    let(:queries) {
      [
        [35, 669, 5],
        [72, 822, 74],
        [47, 933, 94],
        [62, 942, 85],
        [42, 596, 11],
        [56, 1066, 18],
        [54, 571, 45],
        [39, 890, 100],
        [3, 175, 26],
        [48, 1489, 37],
        [40, 447, 52],
        [30, 584, 7],
        [26, 1486, 38],
        [21, 1142, 21],
        [9, 494, 96],
        [56, 759, 81],
        [13, 319, 16],
        [20, 1406, 57],
        [11, 1092, 19],
        [24, 670, 67],
        [38, 1702, 33],
        [5, 676, 32],
        [50, 1386, 77],
        [36, 1551, 87],
        [29, 1445, 13],
        [58, 977, 13],
        [7, 887, 64],
        [37, 1396, 23],
        [0, 765, 69],
        [40, 1083, 86],
        [43, 1054, 49],
        [48, 690, 92],
        [28, 1201, 56],
        [47, 948, 43],
        [57, 233, 25],
        [32, 1293, 65],
        [0, 1646, 34],
        [43, 1467, 39],
        [39, 484, 23],
        [21, 1576, 69],
        [12, 1222, 68],
        [9, 457, 83],
        [32, 65, 9],
        [10, 1424, 42],
        [35, 534, 3],
        [23, 83, 22],
        [33, 501, 33],
        [25, 679, 51],
        [2, 321, 42],
        [1, 240, 68],
        [7, 1297, 42],
        [45, 480, 72],
        [26, 1472, 9],
        [6, 649, 90],
        [26, 361, 57],
        [49, 1592, 7],
        [11, 158, 95],
        [35, 448, 24],
        [41, 1654, 10],
        [61, 510, 43],
        [31, 1230, 95],
        [11, 1471, 12],
        [37, 43, 84],
        [56, 1147, 48],
        [69, 1368, 65],
        [22, 170, 24],
        [56, 192, 80],
        [34, 1207, 69],
        [1, 1226, 22],
        [37, 1633, 50],
        [11, 98, 58],
        [17, 125, 13],
        [0, 1490, 5],
        [37, 1732, 43],
        [45, 793, 14],
        [16, 578, 72],
        [50, 241, 78]
      ]
    }
    it { expect(subject).to eq([true, true, true, true, true, true, true, true, false, false, true, true, false, false, false, true, true, false, false, false, false, false, false, false, false, true, false, false, false, false, false, true, false, true, true, false, false, false, true, false, false, false, false, false, true, true, true, false, false, false, false, true, false, false, true, false, true, true, false, true, false, false, true, true, true, true, true, false, false, false, true, true, false, false, true, false, true]) }
  end

  context "condition 4" do
    let(:candies) { [46, 5, 47, 48, 43, 34, 15, 26, 11, 25, 41, 47, 15, 25, 16, 50, 32, 42, 32, 21, 36, 34, 50, 45, 46, 15, 46, 38, 50, 12, 3, 26, 26, 16, 23, 1, 4, 48, 47, 32, 47, 16, 33, 23, 38, 2, 19, 50, 6, 19, 29, 3, 27, 12, 6, 22, 33, 28, 7, 10, 12, 8, 13, 24, 21, 38, 43, 26, 35, 18, 34, 3, 14, 48, 50, 34, 38, 4, 50, 26, 5, 35, 11, 2, 35, 9, 11, 31, 36, 20, 21, 37, 18, 34, 34, 10, 21, 8, 5] }
    let(:queries) { [[80, 2329, 69], [14, 1485, 76], [33, 2057, 83], [13, 1972, 27], [11, 387, 25], [24, 1460, 47], [22, 1783, 35], [1, 513, 33], [66, 2124, 85], [19, 642, 26], [15, 1963, 79], [93, 722, 96], [15, 376, 88], [60, 1864, 89], [86, 608, 4], [98, 257, 35], [35, 651, 47], [96, 795, 73], [62, 2077, 18], [27, 1724, 57], [34, 1984, 75], [49, 2413, 95], [76, 1664, 5], [28, 38, 13], [85, 54, 42], [12, 301, 3], [62, 2016, 29], [45, 2316, 37], [43, 2360, 28], [87, 192, 98], [27, 2082, 21], [74, 762, 37], [51, 35, 17], [73, 2193, 4], [60, 425, 65], [11, 1522, 58], [21, 1699, 66], [42, 1473, 5], [30, 2010, 48], [91, 796, 74], [82, 2162, 31], [23, 2569, 65], [24, 684, 23], [70, 1219, 51], [5, 1817, 15], [81, 2446, 34], [96, 771, 60], [49, 1171, 60], [41, 567, 67], [39, 799, 59], [90, 957, 81], [84, 2122, 27], [82, 1707, 44], [11, 1889, 20], [80, 1697, 83], [24, 1786, 60], [90, 1847, 99], [51, 114, 21], [44, 466, 85], [56, 469, 20], [44, 350, 96], [66, 1946, 10], [14, 2470, 12], [69, 1175, 18], [98, 1804, 25], [77, 2187, 40], [89, 2265, 45], [19, 2246, 45], [40, 2373, 79], [60, 2222, 17], [37, 385, 5], [97, 1759, 97], [10, 903, 5], [87, 842, 45], [74, 2398, 66], [62, 49, 94], [48, 156, 77], [76, 2310, 80], [64, 2360, 95], [70, 1699, 83], [39, 1241, 66], [92, 2312, 21], [63, 2148, 29], [95, 594, 74], [89, 90, 51], [82, 137, 70], [54, 301, 97], [15, 819, 43], [47, 1402, 60], [17, 2377, 43], [50, 1937, 95], [62, 1174, 74], [67, 1411, 87], [39, 1151, 48]] }
    # it { expect(subject).to eq([false,false,false,false,true,false,false,false,false,false,false,true,true,false,true,true,true,true,false,false,false,false,true,false,true,true,false,false,false,true,false,true,false,false,true,false,false,false,false,true,true,false,true,true,false,false,true,true,true,true,true,true,true,false,true,false,true,true,true,true,true,false,false,true,true,false,true,false,false,false,true,true,false,true,false,true,true,false,false,true,false,true,false,true,true,true,true,false,true,false,false,true,true,true]) }
    it "returns correct result" do
      results = subject
      [false, false, false, false, true, false, false, false, false, false, false, true, true, false, true, true, true, true, false, false, false, false, true, false, true, true, false, false, false, true, false, true, false, false, true, false, false, false, false, true, true, false, true, true, false, false, true, true, true, true, true, true, true, false, true, false, true, true, true, true, true, false, false, true, true, false, true, false, false, false, true, true, false, true, false, true, true, false, false, true, false, true, false, true, true, true, true, false, true, false, false, true, true, true].each_with_index do |res, idx|
        puts queries[idx], res if results[idx] != res
        expect(results[idx]).to eq(res)
      end
    end
  end

  context "condition 5" do
    let(:candies) { [7, 11, 5, 3, 8] }
    let(:queries) { [[2, 2, 6], [4, 2, 4], [2, 13, 1000000000]] }
    it { expect(subject).to eq([false, false, true]) }
  end
end
