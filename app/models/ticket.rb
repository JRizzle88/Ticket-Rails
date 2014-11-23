class Ticket < ActiveRecord::Base
   belongs_to :user
   belongs_to :category
   belongs_to :ticket_status
   validates_presence_of :title, presence: true
   validates_presence_of :description, presence: true
   validates_presence_of :user_id, presence: true
   validates_presence_of :category_id, presence: true
   validates_presence_of :ticket_status_id, presence: true




end
