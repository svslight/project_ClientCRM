class CountriesController < ApplicationController
  
  before_action :authenticate_user!, except: %i[index show]
  before_action :load_country, only: [:update, :destroy, :cancel]
  
  expose :countries, ->{ Country.all }
  expose :country

  authorize_resource

  def create
    if country.save
      redirect_to country_path(country), notice: 'Country successfully created'
    else
      render :new
    end
  end

  def update
    country.update(country_params)
  end

  def cancel
    render json: @country
  end

  def destroy
    country.destroy    
  end

  private

  def load_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name)
  end
end
