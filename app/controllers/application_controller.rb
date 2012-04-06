class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  # for those user whose browser is not using our default_locale, e.g. a Chinese using English broser,
  # just like me. :)
  def set_locale
    I18n.locale = params[:local] || I18n.default_locale
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end
  def check_user_role
    redirect_to root_path unless current_user.role == "admin"
  end
end
