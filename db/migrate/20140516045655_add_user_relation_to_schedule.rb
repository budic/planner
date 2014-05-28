class AddUserRelationToSchedule < ActiveRecord::Migration
  def change
    add_index :schedules, :user_id
  end
end
