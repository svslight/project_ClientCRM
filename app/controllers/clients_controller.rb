class ClientsController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]
  before_action :load_client, only: [:update, :destroy]

  expose :clients, ->{ Client.all }
  expose :client

  def create
    if client.save

      status_client_append(client)

      params[:client][:make_user] ? @user = User.create(client_id: client.id, email: client.email, password: '123456', password_confirmation: '123456' )
        : client.user

      redirect_to client_path(client), notice: 'Client was successfully created'
    else
      render :new
    end
  end

  def update
    client.update(client_params)

    status_client_append(client)

    !params[:client][:make_user] && user_exists?(client) ? client.user.destroy
      : User.create(client_id: client.id, email: client.email, password: '123456', password_confirmation: '123456')
 
    redirect_to clients_path
  end

  def destroy
    client.destroy
    redirect_to clients_path, notice: 'Client was successfully deleted.'
  end

  private

  def status_client_append(client)
    client.status_clients.each{ |s| s.destroy }   
    @ids = params[:client][:ids].to_s.split(/\s/)
    @ids.each do |id|
      status_client = StatusClient.new
      status_client.client = client
      status_client.status = Status.find(id.to_i)
      status_client.save
    end
  end
  
  def user_exists?(client)
    User.where(client_id: client).exists?
  end

  def load_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :surname, :patronymic, :birthdate, :city, :address,
                                   :phon, :skype, :entry_date, :lesson_number, :email,
                                   :communicant_date, :comments, :country_id, :client_status_id,
                                   :group_id, :group_position_id, :team_project_id, :team_position_id,
                                   :make_user, :ids)
  end

end
