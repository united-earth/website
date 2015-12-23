class UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :contacted]
  before_action :at_users

  # GET /users
  # GET /users.json
  def index
    @users = User.where(contacted: false).order(created_at: :desc)
    @mode = :only_new
    if params[:all]
      @users = User.all.order(created_at: :desc)
      @mode = :all
    end
    @contributions = {}
    @users.each do |user|
      unless user.personal_info.nil?
        contribs = contributions_strings_for_user user
        @contributions[user.id] = contribs.join ', '
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def contacted
    @user.contacted = true
    @user.save!
    redirect_to action: :index
  end

  def sync_mailchimp
    User.all.each do |user|
      user.update_mailchimp_status
    end
    redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :firstname, :lastname)
    end

    def contributions_strings_for_user(user)
      strings = []
      user.personal_info.attributes.each_pair do |name, value|
        next if omitted_attributes_for_contribution_strings.include? name
        puts name, value
        strings << t("activerecord.attributes.personal_info.#{name}") if value
      end
      return strings
    end

    def omitted_attributes_for_contribution_strings
      ['updated_at', 'created_at', 'id', 'add_voice', 'newsletter', 'public_feedback', 'contrib_other', 'expertise', 'user_id']
    end

    def at_users
      @at_users = true
    end
end
