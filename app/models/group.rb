class Group < ApplicationRecord
  belongs_to :country, optional: true
  belongs_to :group_status, optional: true

  has_many :clients, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
