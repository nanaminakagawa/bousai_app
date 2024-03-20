class PagesController < ApplicationController
  skip_before_action :require_login
  def privacy_policy;end

  def user_agreement;end

  def contact;end
end
