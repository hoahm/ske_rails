require 'rails_helper'

RSpec.describe HistoriesController, type: :controller do
  login_admin

  describe "GET #index" do
    before { get :index }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:index) }
    it { expect(assigns(:versions)).to be_an(ActiveRecord::Relation) }
  end

end
