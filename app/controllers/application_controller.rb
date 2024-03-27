class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :info, :warning, :danger

  private

  def not_authenticated
    redirect_to login_path, danger: "ログインしてください"
  end

  def redirect_logged_in_user
    redirect_to menu_path if current_user.present?
  end
end
