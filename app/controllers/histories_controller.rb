class HistoriesController < ApplicationController
  skip_authorize_resource

  def index
    add_breadcrumb I18n.t('breadcrumb.histories'), histories_path

    @versions = PaperTrail::Version.order('created_at DESC')
                                   .page(params[:page])
                                   .per(params[:per])
  end
end
