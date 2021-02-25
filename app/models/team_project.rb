class TeamProject < ApplicationRecord
  has_many :clients, dependent: :destroy
end
