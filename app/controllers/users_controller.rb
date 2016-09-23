class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :show, :edit, :destroy]


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

  def sponsor_page
    @user = User.new
  end

  def host_page
    @user = User.new
  end

  def entrepreneur_page
    @user = User.new
  end

  def change_category_page
    @user = User.find_by_confirm_token(params[:id])
    if @user
      flash[:success] = "You are granted access to change your category status."
    else
      flash[:error] = "Sorry. You do not have the access rights to change category status."
      redirect_to root_url
    end
  end

  def resend_confirmation_email
    @user = User.new
  end

  def resend
    @user = User.where(:email => user_params["email"]).first

    respond_to do |format|
      if @user
        # Sends email to user when user is created.
        UserMailer.registration_confirmation(@user).deliver

        format.html { redirect_to '/resent_email_confirmation' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to '/resent_email_confirmation' }
        #format.html { redirect_to root_url }
        #format.js
        #format.html { render :layout => false, :notice => @users.errors }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def resent_email_confirmation

  end

  def confirm_email
    @user = User.find_by_confirm_token(params[:id])
    if @user
      puts "look here"
      puts @user.category
      email_activate(@user)
      flash[:success] = "Your email has been confirmed."
      if @user.category == "sponsor"
              puts @user.email

        redirect_to confirmed_email_sponsor_path(:user => @user)
      elsif @user.category == "host"
        redirect_to confirmed_email_host_path(:user => @user)
      elsif @user.category == "streamer"
        redirect_to confirmed_email_streamer_path(:user => @user)
      elsif @user.category == "fashionista"
        redirect_to '/confirmed_email_fashionista'
      end
    else
      flash[:error] = "Sorry. Email does not exist"
      redirect_to '/confirmed_email'
    end
  end


def confirmed_email_page_sponsor
  @user = User.find(params[:user])
end

def confirmed_email_page_host
  @user = User.find(params[:user])
end

def confirmed_email_page_streamer
  @user = User.find(params[:user])
end


  def submit_questionnaire
    @user = User.where(:confirm_token => user_params["confirm_token"]).first
    edited_user_params = user_params.except("confirm_token") # Removes confim_token from params string to prevent confirm_token being changed.
                                                             # User would still have needed to submit a confirm_token to be able to access change_category_page to begin with.
    respond_to do |format|
      if @user.update(edited_user_params) # also allow admin access!!!
        format.html { redirect_to '/thank_you_for_answers' }
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        #format.json { render :show, status: :ok, location: @user }
      else
        #format.html { render :edit }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
        #format.html { redirect_to '/sponsor' }
      end
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
    @user = User.where(:confirm_token => user_params["confirm_token"]).first
    edited_user_params = user_params.except("confirm_token") # Removes confim_token from params string to prevent confirm_token being changed.
                                                             # User would still have needed to submit a confirm_token to be able to access change_category_page to begin with.
    respond_to do |format|
      if @user.update(edited_user_params) # also allow admin access!!!
        format.html { redirect_to '/change_category_confirmation' }
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        #format.json { render :show, status: :ok, location: @user }
      else
        #format.html { render :edit }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
        format.html { redirect_to '/sponsor' }
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
      params.require(:user).permit(:email, :category, :checkbox_ticked, :checkbox_text, :confirm_token, :company_name, :company_url, :product_or_service_industry, :name, :customer_description)
    end
end
