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
      # p content[1]['shells']
      content[1] = Element.create!(
        name: content[1]['name'],
        appearance: content[1]['appearance'],
        atomic_mass: content[1]['atomic_mass'],
        boil: content[1]['boil'],
        category: content[1]['category'],
        density: content[1]['density'],
        discovered_by: content[1]['discovered_by'],
        melt: content[1]['melt'],
        molar_heat: content[1]['molar_heat'],
        number: content[1]['number'],
        period: content[1]['period'],
        phase: content[1]['phase'],
        source: content[1]['source'],
        summary: content[1]['summary'],
        symbol: content[1]['symbol'],
        xpos: content[1]['xpos'],
        ypos: content[1]['ypos'],
        shells: content[1]['shells'],
        electron_configuration: content[1]['electron_configuration'],
        electron_configuration_semantic: content[1]['electron_configuration_semantic'],
        electron_affinity: content[1]['electron_affinity'],
        electronegativity_pauling: content[1]['electronegativity_pauling'],
        ionization_energies: content[1]['ionization_energies']
      )
      puts "'#{content[1].name}' created!"
    end
  end
end

