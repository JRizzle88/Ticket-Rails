class AddStatusToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :state, :integer, default: 0
  end
end
