class Ticket < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  belongs_to :ticket_status
  has_many :comments, :dependent => :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :ticket_status_id, presence: true



  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end


end
