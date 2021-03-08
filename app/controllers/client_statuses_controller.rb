class ClientStatusesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  # before_action :load_client_status, only: [:update, :destroy]
  
  expose :client_statuses, ->{ ClientStatus.all }
  expose :client_status

  def create
    if client_status.save
      redirect_to client_status_path(client_status) #, notice: 'ClientStatus successfully created'
    else
      render :new
    end
  end

  def update
    if client_status.update(client_status_params)
      redirect_to client_status_path(client_status) 
    else
      render :edit
    end
  end

  def destroy
    client_status.destroy
    redirect_to client_statuses_path #, notice: 'Status client was successfully deleted.'
  end

  private

  # def load_client_status
  #   @client_status = ClientStatus.find(params[:id])
  # end

  def client_status_params
    params.require(:client_status).permit(:name)
  end
end
