class Group < ApplicationRecord
  belongs_to :country, optional: true
  belongs_to :group_status, optional: true

  has_many :clients, dependent: :destroy

  validates :name, presence: true
  validates :city, presence: true
  validates :email, presence: true
  validates :phon, presence: true

  default_scope { order(name: :asc) }
end
