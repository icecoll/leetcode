# @param {Integer[][]} graph
# @return {Integer[][]}
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
