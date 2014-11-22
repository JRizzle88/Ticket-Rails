class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :category_id
      
      t.timestamps
    end
  end
end
