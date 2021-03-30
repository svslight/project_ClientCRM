class Status < ApplicationRecord
  has_many :status_clients, dependent: :destroy
  has_many :clients, through: :status_clients

  validates :name, presence: true, uniqueness: true
end
