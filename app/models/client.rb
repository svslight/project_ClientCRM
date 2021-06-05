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
  scope :list_clients, ->(city) { where(city: city) }

  def save_all
    self.save
    update_tables
  end

  def update(client_params) 
    super    
    update_tables
  end

  private

  def update_tables
    self.status_client_append
    self.project_team_append
    self.client_make_user
  end

  def user_exists?
    User.where(client_id: self).exists?
  end

  def client_make_user
    if self.make_user
      User.create(first_name: self.name, last_name: self.surname, client_id: self.id, email: self.email, password: '123456', password_confirmation: '123456') if !user_exists?
    else
      self.user.destroy if user_exists?     
    end
  end

  def status_client_append
    self.status_clients.each{ |s| s.delete } if self.status_clients.present?
    @ids = self.ids.to_s.split(/\s/)
    @ids.each do |id|
      StatusClient.create(client: self, status: Status.find(id))
    end
  end

  def project_team_append
    self.project_teams.each{ |s| s.delete } if self.project_teams.present?
    @pids = self.pids.to_s.split(/\s/)
    @pids.each do |pid|
      ProjectTeam.create(client: self, project: Project.find(pid))
    end
  end
end
