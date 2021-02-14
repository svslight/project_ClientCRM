class Country < ApplicationRecord
  has_many :clients, dependent: :destroy
  has_many :groups, dependent: :destroy

end
