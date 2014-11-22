class CreateTicketStatuses < ActiveRecord::Migration
  def change
    create_table :ticket_statuses do |t|
      t.string :name
      t.integer :position
      
      t.timestamps
    end
  end
end
