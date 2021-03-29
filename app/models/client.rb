class Client < ApplicationRecord
  attr_accessor :make_user, :ids

  belongs_to :country, optional: true
  belongs_to :group, optional: true
  belongs_to :group_position, optional: true
  belongs_to :team_project, optional: true
  belongs_to :team_position, optional: true
  
  has_one :user, dependent: :destroy  
  
  has_many :status_clients, dependent: :destroy
  has_many :status, through: :status_clients

  validates :name, presence: true
  validates :surname, presence: true
  validates :patronymic, presence: true
  validates :birthdate, presence: true
  validates :city, presence: true
  validates :email, presence: true

  default_scope { order(surname: :asc) }
end
