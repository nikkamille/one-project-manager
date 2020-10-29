class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true
  
  STATUS_TYPES = ["Not Started", "In Progress", "Completed"]
  

end
