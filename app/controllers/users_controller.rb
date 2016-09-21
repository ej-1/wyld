class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @user = User.new
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

  def about
    @user = User.new
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      email_activate(user)
      flash[:success] = "Your email has been confirmed."
      redirect_to '/confirmed_email'
    else
      flash[:error] = "Sorry. Email does not exist"
      redirect_to '/confirmed_email'
    end
  end

  # POST /users
  # POST /users.json
  def create
    @checkbox_text = user_params["checkbox_text"] # Used in signup_form if errors occur.
    @category = user_params["category"] # @checkbox_text = user_params["checkbox_text"]
    edited_user_params = user_params.except("checkbox_text")

    @user = User.new(edited_user_params)
    respond_to do |format|
      if @user.save
        # Sends email to user when user is created.
        UserMailer.registration_confirmation(@user).deliver

        format.html { redirect_to '/confirmation' }
        format.json { render :show, status: :created, location: @user }
      else
        format.js
        #format.html { render :layout => false, :notice => @users.errors }
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

  private

    def email_activate(user)
      user.email_confirmed = true
      #user.confirm_token = nil
      user.save!(:validate => false)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :category, :checkbox_ticked, :checkbox_text)
    end
end
