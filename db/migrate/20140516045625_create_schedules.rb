class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :today
      t.integer :user_id

      t.timestamps
    end
  end
end
