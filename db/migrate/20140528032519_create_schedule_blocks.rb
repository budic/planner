class CreateScheduleBlocks < ActiveRecord::Migration
  def change
    create_table :schedule_blocks do |t|
      t.integer :schedule_id
      t.timestamps
    end
  end
end
