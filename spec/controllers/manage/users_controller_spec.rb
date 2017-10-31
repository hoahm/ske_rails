require 'rails_helper'

RSpec.describe Manage::UsersController, type: :controller do
  login_admin

  describe "GET #index" do
    before { get :index }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:index) }
    it { expect(assigns(:users)).to be_an(ActiveRecord::Relation) }
  end

  describe "GET #show" do
    let(:user) { FactoryGirl.create(:user) }
    before { get(:show, params: { id: user }) }

    it { expect(response).to redirect_to(edit_manage_user_path(user)) }
  end

  describe "GET #new" do
    before { get :new }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:new) }
  end

  describe "GET #create" do
    before { post :create, params: { user: FactoryGirl.attributes_for(:user) } }

    it { expect(response).to have_http_status(:redirect) }
    it { expect(response).to redirect_to(manage_users_path) }
  end

  describe "GET #edit" do
    let(:user) { FactoryGirl.create(:user) }
    before { get(:edit, params: { id: user }) }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:edit) }
    it { expect(assigns(:user)).to eq(user) }
  end

  describe "PUT #update" do
    let(:user) { FactoryGirl.create(:user) }
    before { put(:edit, params: { id: user, last_name: 'Hoa' }) }

    it { expect(response).to have_http_status(:success) }
  end
end
