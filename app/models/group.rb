class Group < ApplicationRecord
  belongs_to :country_id
  belongs_to :group_status_id
  has_many :profiles, dependent: :destroy
end
