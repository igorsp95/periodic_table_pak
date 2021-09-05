class AddShellsToElement < ActiveRecord::Migration[6.1]
  def change
    add_column :elements, :shells, :integer, array: true, default: []
  end
end
