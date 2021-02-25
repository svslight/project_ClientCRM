class Client < ApplicationRecord
  attr_accessor :make_user

  belongs_to :country, optional: true
  belongs_to :client_status, optional: true
  belongs_to :group, optional: true
  belongs_to :group_position, optional: true
  belongs_to :team_project, optional: true
  belongs_to :team_position, optional: true
  has_many :users, dependent: :destroy

  validates :name, presence: true
  validates :surname, presence: true
  validates :patronymic, presence: true
  validates :birthdate, presence: true
  validates :city, presence: true
  validates :email, presence: true

  default_scope { order(surname: :asc) }
end
