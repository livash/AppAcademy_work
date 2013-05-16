require_relative 'database'

class Model
  def self.find(id)
    data = Database.execute(<<-SQL, id)
      SELECT *
        FROM #{table_name}
       WHERE #{table_name}.id = ?
    SQL
    
    new(data.first)
  end
  
  def all
    data = Database.execute(<<-SQL)
      SELECT *
        FROM #{table_name}
    SQL
    
    data.map { |datum| new(datum) }
  end
  
  attr_reader :id

  def initialize(options = {})
    @id = options["id"]
    
    column_names.each do |column_name|
      # SQLite3 gem returns hash with String keys
      column_name_s = column_name.to_s
      
      # call the setter method for the attribute
      send("#{column_name}=", options[column_name_s])
    end
  end
  
  def column_values
    column_names.map { |column_name| send(column_name) }
  end

  def create
    column_names_s = column_names.join(", ")
    question_marks_s = Array.new(column_names.count, "?").join(", ")
    
    query = <<-SQL
      INSERT INTO #{table_name} (#{column_names_s})
      VALUES (#{question_marks_s})
    SQL
    
    Database.execute(query, *column_values)
    @id = Database.instance.last_insert_row_id
  end
  
  def update
    sets = column_names.map do |column_name|
      "#{column_name} = ?"
    end.join(", ")
    
    query = <<-SQL
      UPDATE #{table_name}
         SET #{sets}
       WHERE id = ?
    SQL

    Database.execute(query, *column_values, id)
  end
  
  def save
    if @id
      update
    else
      create
    end
  end
  
  private
  # extenders of Model class will need to define the name of the table.
  def self.table_name(*args)
    if args.count == 0
      # called as getter
      @table_name
    elsif args.count == 1
      # called as setter
      @table_name = args.first
    else
      raise ArgumentError("#{args.count} for 0..1")
    end
  end
  
  def self.column_names(*args)
    if args.count == 0
      @column_names
    else
      @column_names = args
      @column_names.each do |column_name|
        send(:attr_accessor, column_name)
      end
    end
  end
  
  # convenience instance methods call class method
  def table_name
    self.class.table_name
  end
  
  def column_names
    self.class.column_names
  end
end

# TODO: write belongs_to/has_many macros
