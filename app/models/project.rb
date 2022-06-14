class Project < ApplicationRecord
    has_and_belongs_to_many :employees, dependent: :destroy
    has_many :employees_projects
    
    validates :title, presence: true
end
