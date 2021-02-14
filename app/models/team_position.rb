class TeamPosition < ApplicationRecord
  has_many :clients, dependent: :destroy
end
