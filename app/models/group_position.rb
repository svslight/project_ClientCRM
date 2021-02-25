class GroupPosition < ApplicationRecord
  has_many :clients, dependent: :destroy
end
