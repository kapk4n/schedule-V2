class ApplicationController < ActionController::Base
  # before_action :set_locale
  before_action :set_current_user
  around_action :switch_locale
  # def set_locale
  #   I18n.locale = :en
  # end

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in!
    redirect_to root_path, alert: "#{t('application.aler1')}" if Current.user.nil?
  end

  def require_user_admin!
    redirect_to root_path, alert: "#{t('application.aler1')}" if Current.user.nil?
    redirect_to root_path, alert: "#{t('application.aler2')}" if (Current.user.role != "admin" )
  end

  def require_user_teacher!
    redirect_to root_path, alert: "#{t('application.aler1')}" if Current.user.nil?
    redirect_to root_path, alert: "#{t('application.aler3')}" if (Current.user.role != "teacher" )
  end

  private

  def switch_locale(&action)
    locale = locale_from_url || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def locale_from_url
    locale = params[:locale]

    return locale if I18n.available_locales.map(&:to_s).include?(locale)

    nil
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
