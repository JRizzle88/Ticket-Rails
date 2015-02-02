class Task < ActiveRecord::Base
    belongs_to :project
    validates :title, presence: true

    enum state: [:incomplete, :completed]
end
