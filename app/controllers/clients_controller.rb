class ClientsController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]
  before_action :load_client, only: [:update, :destroy]

  expose :clients, ->{ Client.all }
  expose :client

  def create
    if client.save
      if params[:client][:make_user]
        @user=User.create(client_id: client.id, email: client.email, password: '123456', password_confirmation: '123456' )
      end
      redirect_to client_path(client), notice: 'Client successfully created.'
    else
      render :new
    end
  end

  def update   
    if client.update(client_params)
      if params[:client][:make_user]
        @user=User.create(client_id: client.id, email: client.email, password: '123456', password_confirmation: '123456' )
      end
      redirect_to client_path(client)
    else
      render :edit
    end
  end

  def destroy
    client.destroy
    redirect_to clients_path
  end

  private

  def load_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :surname, :patronymic, :birthdate, :city, :address, 
                                    :phon, :skype, :entry_date, :lesson_number, :email,
                                    :communicant_date, :comments, :country_id, :client_status_id,
                                    :group_id, :group_position_id, :team_project_id, :team_position_id, :make_user)
  end
end
