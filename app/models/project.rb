class Project < ApplicationRecord
  has_many :project_teams, dependent: :destroy
  has_many :clients, through: :project_teams

  validates :name, presence: true, uniqueness: true
end
