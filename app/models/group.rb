class Group < ApplicationRecord
  belongs_to :country
  belongs_to :group_status
  has_many :clients, dependent: :destroy
end
