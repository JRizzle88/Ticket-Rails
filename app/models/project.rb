class Project < ActiveRecord::Base

  belongs_to :user
  #belongs_to :project_status
  has_many :tasks

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :due_date, presence: true
  #validates :ticket_status_id, presence: true


end
