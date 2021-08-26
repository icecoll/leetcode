给你一个有 n 个节点的 有向无环图（DAG），请你找出所有从节点 0 到节点 n-1 的路径并输出（不要求按特定顺序）
二维数组的第 i 个数组中的单元都表示有向图中 i 号节点所能到达的下一些节点，空就是没有下一个结点了。
译者注：有向图是有方向的，即规定了 a→b 你就不能从 b→a 。

### 示例 1：
```
输入：graph = [[1,2],[3],[3],[]]
输出：[[0,1,3],[0,2,3]]
解释：有两条路径 0 -> 1 -> 3 和 0 -> 2 -> 3
```

### 示例 2：
```
输入：graph = [[4,3,1],[3,2,4],[3],[4],[]]
输出：[[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]]
```

### 示例 3：
```
输入：graph = [[1],[]]
输出：[[0,1]]
```

### 示例 4：
```
输入：graph = [[1,2,3],[2],[3],[]]
输出：[[0,1,2,3],[0,2,3],[0,3]]
```

### 示例 5：
```
输入：graph = [[1,3],[2],[3],[]]
输出：[[0,1,2,3],[0,3]]
```

### 提示：
- n == graph.length
- 2 <= n <= 15
- 0 <= graph[i][j] < n
- graph[i][j] != i（即，不存在自环）
- graph[i] 中的所有元素 互不相同
- 保证输入为 有向无环图（DAG）

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/all-paths-from-source-to-target

### 解题思路
深度优先搜索，用递归即可解决：
1. 从第0个节点开始找，如果当前节点没有后继节点，或者当前节点是第`n-1`个节点，返回当前节点；
2. 如果当前节点有后继节点，递归查找后继节点的后续路径，向上返回所有以当前节点为起点的后续路径；
注意的点：结束点必须是`n-1`, 所以如果到达`n-1`后，后面的路径要舍弃。

```
def all_paths_source_target(graph)
  all_path(graph, 0).select { |p| p.last == (graph.count - 1) }
end

def all_path(graph, current_node)
  next_nodes = graph[current_node]
  return [current_node] if (current_node == (graph.count - 1)) || next_nodes.empty?
  next_nodes.each_with_object([]) do |next_node, res|
    all_path(graph, next_node).each { |s| res << [current_node, *s] }
  end
end
```