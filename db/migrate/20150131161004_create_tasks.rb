class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :project

      t.timestamps
    end

    add_index :projects, :project_id
  end
end
