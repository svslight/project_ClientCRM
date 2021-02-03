class GroupPosition < ApplicationRecord
  has_many :profiles, dependent: :destroy
end
