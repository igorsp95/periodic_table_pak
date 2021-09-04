# namespace :import do
#   desc 'Import periodic table data from json'
#   task :data, ['db/data.json'] => :environment do |t, args|
#     file = File.read("db/data.json")
#     puts 'rails import:data[file_path] required' && return unless args[file]
#     puts "Importing file #{args[file]}"
    
#     # TODO: Escreva o código para importar os dados aqui

#     elements = JSON.parse(open(file).read)
#     elements.each do |element|
#       element = Element.create!(
#         name: element['name'],
#         atomic_mass: element['atomic_mass'],
#         number: element['number'],
#         symbol: element['symbol']
#       )
#       puts "'#{element.name}' created!"
#     end
#   end
# end

# namespace :import do
# 	# Usage: rake json:set_fields[file_name]
# 	desc "Import periodic table data from json"
# 	task :data, ['db/data.json'] => :environment do |t, args|
# 		file_name = args['db/data.json']
# 		# file_folder  = Rails.root.join('db') 		# Step over the right folder
# 		file = File.read(file_name)		 	# Get the JSON file
# 		elements = JSON.parse(form)						# Get the JSON data to parse
# 		updated_elements = set_fields(elements)					# Set required to ruby Hash

# 		File.open(file_folder.join(form_name + ".json"), "w") do |f|            # Open the file to write
# 			f.puts JSON.pretty_generate(updated_elements)                     # Write the updated JSON
# 		end	
# 	end
	
# 	def set_elements(elements)			
# 		elements.each do |element|
# 			element = Element.create!(
#         name: element['name'],
#         atomic_mass: element['atomic_mass'],
#         number: element['number'],
#         symbol: element['symbol']
#       )
# 		end
#   elements
# 	end
# end

namespace :import do
  desc 'Import periodic table data from json'
  task :data, "data" => :environment do |t, args|
    puts 'rails import:data[file_path] required' && return unless args["data"]
    puts "Importing file #{args["data"]}"

    file_name = args["data"]
		file_folder  = Rails.root('db') 		# Step over the right folder
		file = File.read(file_folder.join('data' + ".json"))		 	# Get the JSON file
    
    # TODO: Escreva o código para importar os dados aqui
    # file_path = File.read("db/data.json")
    elements = JSON.parse(open(file).read)
    elements.each do |element|
      element = Element.create!(
        name: element['name'],
        atomic_mass: element['atomic_mass'],
        number: element['number'],
        symbol: element['symbol']
      )
      puts "'#{element.name}' created!"
    end
  end
end

# namespace :import do
#   desc 'Import periodic table data from json'
#   task :data, file: :environment do |t, args|
#     puts 'rails import:data[file_path] required' && return unless args[:file]
#     puts "Importing file #{args[:file]}"

    
#     # TODO: Escreva o código para importar os dados aqui
#     file_path = File.read("db/data.json")
#     elements = JSON.parse(open(file).read)
#     elements.each do |element|
#       element = Element.create!(
#         name: element['name'],
#         atomic_mass: element['atomic_mass'],
#         number: element['number'],
#         symbol: element['symbol']
#       )
#       puts "'#{element.name}' created!"
#     end
#   end
# end

