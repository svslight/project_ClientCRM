class ClientsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  expose :clients, ->{ Client.all }
  expose :client

  def create
    # @exposed_client = current_user.client.new(client_params)

    if client.save
      redirect_to client_path(client), notice: 'Client successfully created.'
    else
      render :new
    end
  end

  def update
    if client.update(client_params)
      if params[:client][:make_user]
        @user=User.new(client_id: client.id, email: client.email, password: '123456', password_confirmation: '123456' )
        @user.save!
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

  def client_params
    params.require(:client).permit(:name, :surname, :patronymic, :birthdate, :city, :address, 
                                    :phon, :skype, :entry_date, :lesson_number, :email,
                                    :communicant_date, :comments, :country_id, :client_status_id,
                                    :group_id, :group_position_id, :team_project_id, :team_position_id, :make_user)
  end
end
