

def choose_wines(file_name, output_file_name)
  wines = []
  persons = []
  wine_choices_hash = {}
  wine_sales_hash = {}
  results_file = File.new(output_file_name, 'w')
  file = File.open(file_name, 'r').each_line do |line|
    
    temp_array = line.split(' ')
    person_id = temp_array[0].split('n')[1].to_i
    next if persons.include?(person_id)
    wine_id = temp_array[1].split('e')[1].to_i
    #next if wines.include?(wine_id)
    persons << person_id
   
    #wines << wine_id
    
    #results_file.puts("#{person_id}    #{wine_id}")
    wine_sales_hash[person_id] = wine_id
  end
  puts wines.uniq.length
  puts persons.uniq.length
  puts wine_sales_hash.length
  
  
  
  #wine_sales_hash
end

file_name = 'person_wine_3.txt'
results_file = "solution_person_wine_3.txt"
choose_wines(file_name, results_file)