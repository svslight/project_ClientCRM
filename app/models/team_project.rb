class TeamProject < ApplicationRecord
  has_many :profiles, dependent: :destroy
end
