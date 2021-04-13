class GroupPosition < ApplicationRecord
  has_many :clients, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  default_scope { order(name: :asc) }
end
