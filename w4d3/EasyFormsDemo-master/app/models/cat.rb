class Cat < ActiveRecord::Base
  attr_accessible(
    :name,
    :age,
    :sex,
    :biography,
    :coat_color,
    :birth_date
  )
end
