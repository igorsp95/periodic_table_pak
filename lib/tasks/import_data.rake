namespace :import do
  desc 'Import periodic table data from json'
  task :data, ['my-elements-db'] => :environment do |t, args|
    # puts 'rails import:data[file_path] required' && return unless args[:file]
    # puts "Importing file #{args[:file]}"
    file_name = args['my-elements-db']
    file_folder = Rails.root.join('app','assets','sample')
    file = File.read("db/data.json")


    # TODO: Escreva o código para importar os dados aqui
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
