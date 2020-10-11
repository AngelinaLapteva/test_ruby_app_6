class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :require_user, only: [:edit, :update]

  before_action :require_same_user, only: [:edit, :update, :destroy]


  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page], per_page: 4)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @articles = @user.articles_v2s.paginate(page: params[:page], per_page: 4)
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
    # user_params is function downstairs
    @user = User.new(user_params)

    if @user.save
      #  now we want also lig in user who just signed up
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Blog, #{@user.username}" 
      # format.html { redirect_to @user, notice: 'User was successfully created.' }
      # format.json { render :show, status: :created, location: @user }
      redirect_to articles_v2s_path
    else
      # format.html { render :new }
      # format.json { render json: @user.errors, status: :unprocessable_entity }
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    # after destroing since destroyed user was logged in , session will lose its id, si its needs to be nullified
    session[:user_id] = nil
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to articles_v2s_path
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit your own account"
      redirect_to @user
    end
  end
