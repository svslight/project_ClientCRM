class Group < ApplicationRecord
  belongs_to :country, optional: true
  belongs_to :group_status, optional: true

  has_many :clients, dependent: :destroy

  validates :name, presence: true
  validates :city, presence: true
  validates :email, presence: true
  validates :phon, presence: true

  default_scope { order(name: :asc) }

  def self.select_groups_by_status(group_status_id)
    group_status_id.empty? ? all : where(group_status_id: group_status_id)   
  end
end
