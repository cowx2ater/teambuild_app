class RemoveUserFromTeam < ActiveRecord::Migration[5.1]
  def change
    remove_reference :teams, :user, foreign_key: true
  end
end
