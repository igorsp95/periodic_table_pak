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

# namespace :import do
#   desc 'Import periodic table data from json'
#   task :data, [:file_name] => :environment do |t, args|
#     puts 'rails import:data[file_path] required' && return unless args[:file_name]
#     puts "Importing file #{args[:file_name]}"

#     file_name = args[:file_name]
# 		file_folder  = Rails.root('db')
# 		file = File.read(file_folder.join(file_name + ".json"))
    
#     # TODO: Escreva o código para importar os dados aqui
#     elements = JSON.parse(file)
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
#   desc 'Import periodic table data from json'
#   task :data, file: :environment do |t, args|
#     puts 'rails import:data[file_path] required' && return unless args[:file]
#     puts "Importing file #{args[:file]}"

    
#     # TODO: Escreva o código para importar os dados aqui
#     file_path = File.read("db/data.json")
#     elements = JSON.parse(open(file).read)
#     elements.each do |element|
#       element = Element.create!(
        # name: element['name'],
        # atomic_mass: element['atomic_mass'],
        # number: element['number'],
        # symbol: element['symbol']
#       )
#       puts "'#{element.name}' created!"
#     end
#   end
# end

namespace :import do
  desc 'Import periodic table data from json'
  task :data, [:file] => :environment do |_t, args|
    puts 'rails import:data[file_path] required' && return unless args[:file]
    puts "Importing file #{args[:file]}"

    # TODO: Escreva o código para importar os dados aqui
    
    filepath = Rails.root.join('db', "#{args[:file]}.json")
    file = File.read(filepath)
    contents = JSON.parse(file)
    contents.drop(1).each do |content|
      # p content[1]
      content[1] = Element.create!(
        name: content[1]['name'],
        atomic_mass: content[1]['atomic_mass'],
        number: content[1]['number'],
        symbol: content[1]['symbol']
      )
      puts "'#{content[1].name}' created!"
    end

    # p contents["hydrogen"]['number']
  end
end

