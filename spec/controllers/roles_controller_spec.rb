require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  login_admin

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:role)
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe "GET #index" do
    before { get :index }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:index) }
    it { expect(assigns(:roles)).to be_an(ActiveRecord::Relation) }
  end

  describe "GET #show" do
    let(:role) { FactoryGirl.create(:role) }
    before { get(:show, params: { id: role }) }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:show) }
    it { expect(assigns(:role)).to eq(role) }
    it { expect(assigns(:users)).to be_an(ActiveRecord::Relation) }
  end

  describe "GET #new" do
    before { get :new }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:new) }
  end

  describe "GET #edit" do
    let(:role) { FactoryGirl.create(:role) }
    before { get(:edit, params: { id: role }) }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:edit) }
  end

  describe "DELETE #destroy" do
    it "destroys the requested role" do
      role = Role.create! valid_attributes
      expect {
        delete :destroy, params: { id: role.to_param }
      }.to change(Role, :count).by(-1)
    end

    it "redirects to the roles list" do
      role = Role.create! valid_attributes
      delete :destroy, params: { id: role.to_param }
      expect(response).to redirect_to(roles_path)
    end
  end
end
