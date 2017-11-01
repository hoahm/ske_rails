class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_breadcrumb I18n.t('breadcrumb.home'), :root_path
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit

  rescue_from CanCan::AccessDenied do
    if current_user.nil?
      session[:next] = request.fullpath
      redirect_to login_url, alert: I18n.t('helpers.required_login')
    else
      render file: Rails.root.join('public', '403.html'), status: 403, layout: false
    end
  end

  load_and_authorize_resource except: [:index], unless: :devise_controller?
  authorize_resource only: [:index]

  private

  def user_for_paper_trail
    user_signed_in? ? current_user.id : 'Guest'
  end
end
