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

  default_scope { order(admin: :desc) }

  private

  def self.role_user_append(user)
    user.role_users.each{ |s| s.delete } if user.role_users.present?
    @rids = user.rids.to_s.split(/\s/)
    @rids.each do |rid|
      role_user = RoleUser.create(user: user, role: Role.find(rid))
    end
  end

end
