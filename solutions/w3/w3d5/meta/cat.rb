require_relative 'model'

class Cat < Model
  table_name :cats
  column_names :fname, :lname, :age, :owner
end

def test
  gizmo = Cat.new(
    "fname" => "Gizmo",
    "lname" => "Ruggeri",
    "owner" => "Kate Ruggeri",
    "age" => 16
  )
  
  gizmo.save
  
  gizmo2 = Cat.find(gizmo.id)
end