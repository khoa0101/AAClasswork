class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :activation_token, :activated
  end
end
