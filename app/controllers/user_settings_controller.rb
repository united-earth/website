class UserSettingsController < ApplicationController
  def index
  end

  def update_user
    current_user.update user_params
    flash[:success] = t('.success')
    render :index
  end

  def update_personal_info
    current_user.personal_info.update person_info_params
    flash[:success] = t('.success')
    render :index
  end

  private
    def user_params
      params.require(:user).permit(:firstname, :lastname)
    end

    def person_info_params
      params.require(:personal_info).permit(
                                        :add_voice,
                                        :newsletter,
                                        :public_feedback,
                                        :contrib_admin,
                                        :contrib_coord,
                                        :contrib_writing,
                                        :contrib_translations,
                                        :contrib_webdev,
                                        :contrib_design,
                                        :contrib_dev,
                                        :contrib_avprod,
                                        :contrib_communication,
                                        :contrib_networking,
                                        :contrib_education,
                                        :contrib_art,
                                        :contrib_management,
                                        :contrib_fundraising,
                                        :contrib_funding,
                                        :contrib_other,
                                        :expertise
      )
    end
end

