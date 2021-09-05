class AddIonizationEnergiesToElement < ActiveRecord::Migration[6.1]
  def change
    add_column :elements, :ionization_energies, :float, array: true, default: []
  end
end
