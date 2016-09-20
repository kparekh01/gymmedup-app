class AddColumnsToGyms < ActiveRecord::Migration[5.0]
  def change
    add_column :gyms, :name, :string
    add_column :gyms, :address, :string
  end
end
