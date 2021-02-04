class Country < ApplicationRecord
  has_many :profiles, dependent: :destroy
  has_many :groups, dependent: :destroy

  # def country?(resource)
  #   id == resource.country_id
  # end
end
