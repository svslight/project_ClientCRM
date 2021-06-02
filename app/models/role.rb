class Role < ApplicationRecord

  has_many :role_users, dependent: :destroy
  has_many :users, through: :role_users

  validates :name, presence: true, uniqueness: true
  validate :control_all

  private

  def control_all
    self.role_read = 'All' if self.role_read.include? 'All'
    self.role_create = 'All' if self.role_create.include? 'All'
    self.role_update = 'All' if self.role_update.include? 'All'
    self.role_destroy = 'All' if self.role_destroy.include? 'All'
  end

end
