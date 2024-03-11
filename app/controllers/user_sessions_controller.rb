class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create new]


  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])#emailとpasswordが一致していれば@userにデータが代入される(loginメソッドで検証を行なっている)
    if @user #訳：loginメソッドで検証が一致して、@userにデータだ代入されたら
      redirect_to menu_path
    else
      render :new #ログイン出来なかったら、ログインページ（'user_sessions#new'）にリダイレクトされる
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
