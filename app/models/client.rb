class Client < ApplicationRecord
  attr_accessor :make_user, :ids, :pids

  belongs_to :country, optional: true
  belongs_to :group, optional: true
  belongs_to :group_position, optional: true
  belongs_to :team_position, optional: true
  
  has_one :user, dependent: :destroy  
  
  has_many :status_clients, dependent: :destroy
  has_many :status, through: :status_clients

  has_many :project_teams, dependent: :destroy
  has_many :project, through: :project_teams

  validates :name, presence: true
  validates :surname, presence: true
  validates :patronymic, presence: true
  validates :birthdate, presence: true
  validates :city, presence: true
  validates :email, presence: true

  default_scope { order(surname: :asc) }

  private

  def self.user_exists?(client)
    User.where(client_id: client).exists?
  end

  def self.make_user(client)
    if client.make_user
      User.create(first_name: client.name, last_name: client.surname, client_id: client.id, email: client.email, password: '123456', password_confirmation: '123456') if !user_exists?(client)
    else
      client.user.destroy if user_exists?(client)      
    end
  end

  def self.status_client_append(client)
    client.status_clients.each{ |s| s.delete } if client.status_clients.present?
    @ids = client.ids.to_s.split(/\s/)
    @ids.each do |id|
      status_client = StatusClient.create(client: client, status: Status.find(id))
    end
  end

  def self.project_team_append(client)
    client.project_teams.each{ |s| s.delete } if client.project_teams.present?
    @pids = client.pids.to_s.split(/\s/)
    @pids.each do |pid|
      project_team = ProjectTeam.create(client: client, project: Project.find(pid))
    end
  end
end
