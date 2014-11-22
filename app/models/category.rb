class Category < ActiveRecord::Base
  has_many :tickets
  validates_presence_of :name
  validates_uniqueness_of :name

  def is_associated?
    tickets.count > 0
  end
end
