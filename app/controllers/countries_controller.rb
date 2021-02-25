class CountriesController < ApplicationController
  
  # before_action :authenticate_user!, except: %i[index show]
  before_action :load_country, only: [:update, :destroy]
  
  expose :countries, ->{ Country.all }
  expose :country

  def create
    if country.save
      redirect_to country_path(country)
    else
      render :new
    end
  end

  def update
    if country.update(country_params)
      redirect_to country_path(country)
    else
      render :edit
    end
  end

  def destroy
    country.destroy
    redirect_to countries_path
  end

  private

  def load_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name)
  end
end
