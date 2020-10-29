class Project < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks
    validates :title, presence: true
end
