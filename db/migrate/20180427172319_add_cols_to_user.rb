class AddColsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rank, :integer
    add_column :users, :set_time, :datetime
    add_column :users, :etc, :string
    add_column :users, :no, :string
  end
end
