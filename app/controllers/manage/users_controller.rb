module Manage
  class UsersController < ApplicationController
    before_action :add_default_breadcrumb
    before_action :find_resource, only: %w(show edit update destroy)

    def index
      @users ||= User.page(params[:page]).per(params[:per])
    end

    def show
      redirect_to edit_manage_user_path(@user)
    end

    def new
      add_breadcrumb I18n.t('helpers.new'), new_manage_user_path
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to manage_users_path, notice: I18n.t('helpers.create.successfully')
      else
        render :new
      end
    end

    def edit
      add_breadcrumb @user.full_name, manage_user_path(@user)
    end

    def update
      if @user.update_attributes(user_params)
        redirect_to manage_users_path, notice: I18n.t('helpers.update.successfully')
      else
        render :edit
      end
    end

    def destroy; end

    private

    def add_default_breadcrumb
      add_breadcrumb I18n.t('breadcrumb.users'), :manage_users_path
    end

    def find_resource
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:id, :email, :password, :full_name, :role_id, :avatar)
    end
  end
end
