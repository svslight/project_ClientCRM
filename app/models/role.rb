class Role < ApplicationRecord

  has_many :role_users, dependent: :destroy
  has_many :users, through: :role_users

  validates :name, presence: true, uniqueness: true
  validate :control_all

  private

  def control_all
    self.role_read = 'all' if self.role_read.include? 'all'
    self.role_create = 'all' if self.role_create.include? 'all'
    self.role_update = 'all' if self.role_update.include? 'all'
    self.role_destroy = 'all' if self.role_destroy.include? 'all'
  end
end
