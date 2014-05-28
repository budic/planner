class AddEndToSchedBlock < ActiveRecord::Migration
  def change
    add_column :schedule_blocks, :endTime, :datetime
    add_column :schedule_blocks, :completed, :boolean
  end
end
