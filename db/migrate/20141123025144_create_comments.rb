class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :ticket

      t.timestamps
    end

    add_index :comments, :ticket_id
  end

  def self.down
  	drop_table :comments
  end
end
