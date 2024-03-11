class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit]
  skip_before_action :require_login, only: %i[new create index]

  # GET /users or /users.json
  def index
    @users = User.new
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id

      flash[:notice] = "ログインしました"
      redirect_to menu_index_path
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to menu_path, notice: 'ユーザーを登録しました'
    else
      flash.now[:alert] = 'ユーザーが登録できませんでした'
      render :new
    end
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
    flash[:notice] = "権限がありません"
    redirect_to("/posts/index")
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :last_name, :first_name, :password, :password_confirmation, :crypted_password, :salt)
    end
end
