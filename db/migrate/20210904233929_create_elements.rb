class CreateElements < ActiveRecord::Migration[6.1]
  def change
    create_table :elements do |t|
      t.string :name
      t.string :appearance
      t.float :atomic_mass
      t.integer :boil
      t.string :category
      t.float :density
      t.string :discovered_by
      t.integer :melt
      t.float :molar_heat
      t.integer :number
      t.integer :period
      t.string :phase
      t.string :source
      t.text :summary
      t.string :symbol
      t.integer :xpos
      t.integer :ypos
      t.text :electron_configuration
      t.string :electron_configuration_semantic
      t.float :electron_affinity
      t.float :electronegativity_pauling

      t.timestamps
    end
  end
end
