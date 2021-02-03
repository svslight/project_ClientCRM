class ClientStatus < ApplicationRecord
  has_many :profiles, dependent: :destroy
end
