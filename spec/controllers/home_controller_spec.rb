require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  login_admin

  describe "GET #index" do
    before { get :index }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:index) }
  end
end
