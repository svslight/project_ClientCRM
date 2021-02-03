class TeamPosition < ApplicationRecord
  has_many :profiles, dependent: :destroy
end
