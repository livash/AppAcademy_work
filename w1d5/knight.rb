# Knight's Travails

# How should we define a Board?

require './treenode.rb'

def knight_path_bfs(start, finish)
  tree_root = make_tree_for(start)
  search_result = tree_root.bfs(finish)
  if finish == search_result.value
    return path_to_root(search_result).reverse
  end
  nil
end

def knight_path_dfs(start, finish)
  tree_root = make_tree_for(start)
  search_result = tree_root.dfs(finish)
  if finish == search_result.value
    return path_to_root(search_result).reverse
  end
  nil
end

def make_tree_for(position) # aka move_tree
  root = TreeNode.new(nil, position)
  visited_positions = [position]

  last_tree_level = [position]

  until last_tree_level.empty?
    new_positions = []
    last_tree_level.each do |recent_position|
      move_knight(recent_position).each do |new_move|
        unless visited_positions.include?(new_move)
          #p "Came to #{new_move.inspect} from #{recent_position.inspect}"
          TreeNode.new(root.bfs(recent_position), new_move)
          visited_positions << new_move
          new_positions << new_move
        end
      end

      last_tree_level = new_positions

    end
  end
  #root.children.each {|child| p child.value}
  root
end

# helper method
# moves knight
def move_knight(position)
  possible_moves = []

  modifiers = [1, -1, 2, -2]
  modifiers.each do |mod|
    modifiers.each do |mod2|
      possible_moves << [ position.first - mod, position.last - mod2 ] unless mod.abs == mod2.abs
    end
  end

  valid_moves(possible_moves)
end

def valid_moves(possible_moves)
  possible_moves.select {|move| move.first.between?(0,7) && move.last.between?(0,7) }
end

# helper method
# reconstruct path
def path_to_root(node)
  path = [node.value]
  until node.parent == nil
    path << node.parent.value
    node = node.parent
  end
  path
end

def display(path)

end