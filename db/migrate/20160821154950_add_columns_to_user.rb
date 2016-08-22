class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_name, :string, unique: true
    add_column :users, :admin, :boolean, default: false
    add_column :users, :bio, :text
    add_column :users, :birth_date, :date
  end
end
