class Group < ApplicationRecord
  belongs_to :country_id
  belongs_to :group_status_id
end
