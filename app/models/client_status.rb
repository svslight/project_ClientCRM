class ClientStatus < ApplicationRecord
  has_many :clients, dependent: :destroy
end
