class TreeNode
  attr_accessor :parent, :children, :value

  def initialize(parent, value)
    self.parent = parent
    #parent.children << self unless parent.nil?
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

  def dfs(target)
    block_given? ? condition = Proc.new : condition = Proc.new {|node| node.value == target}

    if condition.call(self)  #self.value == target    {|node| node.value == target}
      return self
    else
      self.children.each do |child|
        child_search = child.dfs(target, &condition) unless child.nil?
        return child_search unless child_search.nil?
      end

      nil
    end
  end

  def bfs(target)
    block_given? ? condition = Proc.new : condition = Proc.new {|node| node.value == target}
    array = [self]
    until array.empty?
      sn = array.pop
      return sn if condition.call(sn)
      sn.children.each do |child|
        array << child unless child.nil?
      end
    end
    nil

    #yeild if block_given?
  end
  #end of class
end

# one = TreeNode.new(nil, "hi")
# two = TreeNode.new(one, "ruby")
# three = TreeNode.new(one, "gem")
# four = TreeNode.new(three, "cat")
# five = TreeNode.new(nil, "cars")
# four.add_child(five)
#
# master = TreeNode.new(nil, "i am maste")
# one.parent = master
#
# p master.bfs(nil) { |node| (node.value)[0] == "r" }.value
