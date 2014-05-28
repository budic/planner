class AddNameToTimeBlock < ActiveRecord::Migration
  def change
    add_column :time_blocks, :name, :string
    add_column :time_blocks, :user_id, :integer
  end
end
