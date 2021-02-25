class GroupStatus < ApplicationRecord
  has_many :groups, dependent: :destroy
end
