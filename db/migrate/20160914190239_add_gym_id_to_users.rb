class AddGymIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gym_id, :integer
  end
end
