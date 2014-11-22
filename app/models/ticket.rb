class Ticket < ActiveRecord::Base
   belongs_to :user
   belongs_to :category
   belongs_to :ticket_status
   validates_presence_of :title, :description, :user_id, :category_id, :ticket_status_id


end
