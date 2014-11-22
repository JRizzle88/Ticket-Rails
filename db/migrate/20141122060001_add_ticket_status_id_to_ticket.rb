class AddTicketStatusIdToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :ticket_status_id, :integer
  end
end
