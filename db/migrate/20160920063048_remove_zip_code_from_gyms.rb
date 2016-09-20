class RemoveZipCodeFromGyms < ActiveRecord::Migration[5.0]
  def change
    remove_column :gyms, :zip_code, :string
  end
end
