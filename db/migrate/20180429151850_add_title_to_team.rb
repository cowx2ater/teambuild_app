class AddTitleToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :title, :string
  end
end
