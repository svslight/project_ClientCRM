class CountriesController < ApplicationController
  before_action :authenticate_user!

  expose :country
  expose :countries, ->{ Country.all }

  def create
    @exposed_country = profile.countries.new(country_params)

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
