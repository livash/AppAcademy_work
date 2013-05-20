#try to write once more a TreeNode class
require 'debugger'
$dfs_counter = 0
$bfs_counter = 0
class TreeNode
  attr_accessor :parent, :value, :children
  
  def initialize(parent, value)
    self.parent = parent  #parent node for this node
    self.value = value  # value for this node
    @children = [] # children nodes of this node
    
  end
  
  def parent=(new_parent)
    #if node already has a parent, delete yourself prom children list in the old parent
      self.parent.children.delete(self) unless self.parent.nil?
      @parent = new_parent
      #add yourself to the children of new_parent unless you are the root of the tree, i.e.
      # unless you have no parent
      new_parent.children << self unless new_parent.nil? 
      
  end
  
  # depth first serach method
  # return nil if no connetion is found between self and node with value == target
  # return target node, in case there is path between self and target
 
  
  
  def dfs(target)
    $dfs_counter += 1
    
    self.children.each do |child|
      return child if child.value == target
      child_search = child.dfs(target) 
      next if child_search.nil? 
      return child_search if child_search.value == target     
    end
    
    nil
  end
  
  def bfs(target)
    array = [self]
    
    until array.empty?
      $bfs_counter += 1
      search_node = array.pop
      return search_node if search_node.value == target
      search_node.children.each do |child|
        array << child
      end
    end
    
    nil
  end
  
  #end of class
end

#test my code here

if __FILE__ == $PROGRAM_NAME
 # debugger
  root = TreeNode.new(nil,"one")
  two = TreeNode.new(root, "two")
  three = TreeNode.new(root, "three")
  four = TreeNode.new(two, "four")
  five = TreeNode.new(two, "five")
  six = TreeNode.new(three, "six")
  seven = TreeNode.new(three, "seven")
  
  p root.dfs("seven").value
  p root.bfs("seven").value
  p "DFS counter = #{$dfs_counter}"
  p "BFS counter = #{$bfs_counter}"
  
  
end