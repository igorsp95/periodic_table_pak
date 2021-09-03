class CreateElements < ActiveRecord::Migration[6.1]
  def change
    create_table :elements do |t|
      t.string :name
      t.string :atomic_mass
      t.integer :number
      t.string :symbol

      t.timestamps
    end
  end
end
