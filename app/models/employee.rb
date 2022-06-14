class Employee < ApplicationRecord
    has_and_belongs_to_many :projects, dependent: :destroy
    belongs_to :division
    has_many :employees_projects

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
end
