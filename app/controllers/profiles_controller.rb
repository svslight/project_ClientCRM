class ProfilesController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]

    expose :profiles, ->{ Profile.all }
    expose :profile
  
    def create
      @exposed_profile = current_user.profiles.new(profile_params)

      if profile.save
        redirect_to profile_path(profile), notice: 'Client successfully created.'
      else
        render :new
      end
    end
  
    def update
      if profile.update(profile_params)
        if params[:profile][:make_user] == true
          @user=User.new(profile_id: profile.id, email: profile.email, password: '123456', password_confirmation: '123456' )
          @user.save!
        end
        redirect_to profile_path(profile)
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
      params.require(:profile).permit(:name, :surname, :patronymic, :birthdate, :city, :address, 
                                      :phon, :skype, :entry_date, :lesson_number, :email,
                                      :communicant_date, :comments, :country_id, :client_status_id,
                                      :group_id, :group_position_id, :team_project_id, :team_position_id,
                                      :make_user)
    end
end
