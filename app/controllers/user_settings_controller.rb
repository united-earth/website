class UserSettingsController < ApplicationController
  def index
    @groups = current_user.groups.active
  end

  def new_group
    @group = Group.new
  end

  def create_group
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      redirect_to user_settings_path, notice: 'Group was successfully created.'
    else
      render :new
    end
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

  def edit_group
    @group = current_user.groups.find params[:id]
  end

  def update_group
    @group = current_user.groups.find params[:id]
    if @group.update group_params
      redirect_to user_settings_path, notice: 'Group was successfully updated.'
    end
  end

  def remove_group
    @group = current_user.groups.find params[:id]
    if @group
      @group.deleted = true
      @group.save!
      redirect_to user_settings_path, notice: 'Group was successfully updated.'
    else
      redirect_to user_settings_path, error: 'Group not found.'
    end
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

  def group_params
    params.require(:group).permit(:name, :contact_name, :contact_email, :country, :website, :logo, :cat_ecological, :cat_environment, :cat_indi, :cat_social, :cat_economics, :cat_political, :cat_animal, :cat_activism, :cat_tech, :cat_holistic, :cat_conscious, :comment)
  end
end

