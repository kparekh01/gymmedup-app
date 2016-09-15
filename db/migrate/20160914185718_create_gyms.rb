class CreateGyms < ActiveRecord::Migration[5.0]
  def change
    create_table :gyms do |t|
      t.string :zip_code

      t.timestamps
    end
  end
end
