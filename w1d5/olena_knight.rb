# Knight's Travails

# How should we define a Board?

def knight_path(start, finish)

end

# helper method;
# build a tree for the position = [:e, 4]
def make_tree_for(position)
  root = TreeNode.new(nil, position)


end

# helper method
# moves knight
def move_knight
  #there is no more than eight moves
end


class TreeNode
  attr_accessor :parent, :children, :value

  def initialize(parent, value)
    self.parent = parent
    parent.children << self unless parent.nil?
    self.value = value
    self.children = []
  end

  def parent=(new_parent)
    @parent.children.delete(self) if !@parent.nil?
    @parent = new_parent
    new_parent.children << self unless new_parent.nil?
  end

  def add_child(child)
    self.children << child
    child.parent = self
  end

end
