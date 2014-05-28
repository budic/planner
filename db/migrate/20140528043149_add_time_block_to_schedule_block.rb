class AddTimeBlockToScheduleBlock < ActiveRecord::Migration
  def change
    add_column :schedule_blocks, :time_block_id, :integer
  end
end
