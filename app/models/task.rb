class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :project_title, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true
  
  STATUS_TYPES = ["Not Started", "In Progress", "Completed"]

  def project_title=(title)
    self.project = Project.find_or_create_by(title: title)
  end

  def project_title
    self.project ? self.project.title : nil
  end
  

end
