class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :client, optional: true

  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  validates :email, :uniqueness => true

  default_scope { order(admin: :desc) }
end
