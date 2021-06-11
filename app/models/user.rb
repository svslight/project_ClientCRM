class User < ApplicationRecord
  attr_accessor :rids

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable        

  belongs_to :client, optional: true

  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  validates :email, :uniqueness => true
  validates :first_name, presence: true
  validates :last_name, presence: true

  default_scope { order(first_name: :asc) }

  def admin?
    self.roles.pluck(:code).include?('admin')
  end

  def update(user_params)
    super

    self.role_users.each{ |s| s.delete } if self.role_users.present?
    @rids = self.rids.to_s.split(/\s/)
    @rids.each do |rid|
      RoleUser.create(user: self, role: Role.find(rid))
    end
  end
end
