class ClientsController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]
  before_action :load_client, only: [:show, :edit, :update, :destroy]

  expose :clients, ->{ Client.all }
  expose :client

  authorize_resource

  def create
    if client.save
      Client.status_client_append(client)
      Client.project_team_append(client)
      Client.make_user(client)
      
      redirect_to client_path(client), notice: 'Client was successfully created'
    else
      render :new
    end
  end

  def update
    client.update(client_params)
    Client.status_client_append(client)
    Client.project_team_append(client)
    Client.make_user(client)    

    redirect_to clients_path
  end

  def destroy
    # authorize! :destroy, @client

    client.destroy
    redirect_to clients_path, notice: 'Client was successfully deleted.'
  end

  private

  def load_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :surname, :patronymic, :birthdate, :city, :address,
                                   :phon, :skype, :entry_date, :lesson_number, :email,
                                   :communicant_date, :comments, :country_id,
                                   :group_id, :group_position_id, :team_position_id,
                                   :make_user, :ids, :pids)
  end
end
