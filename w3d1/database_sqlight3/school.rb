require 'singleton'
require 'sqlite3'

class SchoolDatabase < SQLite3::Database
  include Singleton
  
  def initialize
    self.results_as_hash = true
    self.type_translation = true
  end
  
  def get_departments
    SchoolDatabase.instance.execute("SELECT * FROM departments")
  end
  
  def add_department(name)
    SchoolDatabase.instance.execute(
    "INSERT INTO departments ('name') VALUES (?)", name)
  end
  
  def add_professor(first_name, last_name, dept_id)
    SchoolDatabase.instance.execute(<<-SQL
    "INSERT INTO professors ('first_name', 'last_name', 'department_id')
     VALUES (?, ?, ?)" 
     SQL
     , firsst_name, last_name, dept_id
    )
  end
end