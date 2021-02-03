class CountriesController < ApplicationController
  # before_action :authenticate_user!

  expose :countries, -> { Country.all }
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

  def country_params
    params.require(:country).permit(:name)
  end
end
