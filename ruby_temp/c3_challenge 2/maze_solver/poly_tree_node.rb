class PolyTreeNode
  attr_accessor :value
  attr_reader :parent
  
  def initialize(value = nil)
    @value, @parent, @children = value, nil, []
  end
  
  def children
    @children.dup
  end
  
  def add_child(new_child)
    @children << new_child
    new_child.parent = self
  end
  
  #depth first search
  def dfs(target) 
    return self if @value == target
    
    @children.each do |child|
      next if child.nil?
      
      result = child.dfs(target)
      return result unless result.nil?
    end
    
    nil
  end
  
  #returns all visited nodes until the target is found
  def dfs_path(target, visited = [])
    return visited if value == target
    
    @children.each do |child|
      next if child.nil?

      visited << child
      result = child.dfs_path(target, visited)
      return result unless result.nil?
    end
    
    nil
  end
  
  protected
  attr_writer :parent
end

# from all visited nodes construct the last path
# the search algorithm took before it reached the target
def parse_path(start_node, visited_nodes_array)
  result = []
  until visited_nodes_array.length == 0
    node = visited_nodes_array.pop
    if start_node.children.include?(node)
      result << node
      break
    else
      result << node
    end
  end
  result << start_node
  
  result.reverse
end

if $PROGRAM_NAME == __FILE__
  a = PolyTreeNode.new(1)
  b = PolyTreeNode.new(2)
  c = PolyTreeNode.new(3)
  d = PolyTreeNode.new(4)
  e = PolyTreeNode.new(5)
  a.add_child(b)
  a.add_child(c)
  c.add_child(d)
  b.add_child(e)
  #puts a.dfs(4).value
 visited = a.dfs_path(5)
 puts parse_path(a, visited).map {|node| node.value}
end