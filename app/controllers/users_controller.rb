class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit]
  skip_before_action :require_login, only: %i[new create index]

  # GET /users or /users.json
  def index
    @users = User.new
  end

  # GET /users/1 or /users/1.json
  def show;end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit;end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      flash[:notice] = "ユーザー登録に成功しました"
      redirect_to menu_path
    else
      flash.now[:error] = 'ユーザーが登録できませんでした'
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password, :password_confirmation)
  end
end
