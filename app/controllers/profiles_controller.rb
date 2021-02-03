class ProfilesController < ApplicationController
    before_action :authenticate_user!

    expose :profiles, -> { Profile.all }
    expose :profile
  
    def create
      if profile.save
        redirect_to profile_path(profile)
      else
        render :new
      end
    end
  
    def update
      if profile.update(profile_params)
        redirect_to country_path(country)
      else
        render :edit
      end
    end
  
    def destroy
      profile.destroy
      redirect_to profiles_path
    end
  
    private
  
    def profile_params
      params.require(:profile).permit(:name, :surname, :patronymic, :birthdate, :city, 
                                      :phon, :skype, :entry_date, :lesson_number,
                                      :communicant, :communicant_date, :comments)
    end
end
