class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :schedule_id
      t.integer :task_id
      t.integer :position

      t.timestamps
    end
  end
end
