class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_breadcrumb I18n.t('breadcrumb.home'), :root_path
  before_action :authenticate_user!
end
