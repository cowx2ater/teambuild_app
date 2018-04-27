class RemoveColsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :rank, :string
    remove_column :users, :set_time, :string
    remove_column :users, :etc, :string
    remove_column :users, :no, :string
  end
end
