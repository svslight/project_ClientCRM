class Country < ApplicationRecord
  has_many :profiles, dependent: :destroy
  has_many :groups, dependent: :destroy
end
