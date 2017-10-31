class RolesController < ApplicationController
  before_action :add_default_breadcrumb
  before_action :find_resource, only: %w(show edit update destroy)

  def index
    @roles ||= Role.page(params[:page]).per(params[:per])
  end

  def show
    add_breadcrumb @role.name, role_path(@role)
    @users ||= @role.users.page(params[:page]).per(params[:per])
  end

  def new
    add_breadcrumb I18n.t('helpers.new'), new_role_path
    @role = Role.new(permissions: {})
  end

  def create
    @role = Role.new(role_params)
    @role.permissions = permission_to_hash(params[:role][:permissions])

    if @role.save
      redirect_to roles_path, notice: I18n.t('helpers.create.successfully')
    else
      render :new
    end
  end

  def edit
    add_breadcrumb @role.name, edit_role_path(@role)
  end

  def update
    @role.name = params[:role][:name]
    @role.permissions = permission_to_hash(params[:role][:permissions])

    if @role.save
      redirect_to roles_path, notice: I18n.t('helpers.update.successfully')
    else
      render :edit
    end
  end

  def destroy
    @role.destroy

    redirect_to roles_url, notice: I18n.t('helpers.destroy.successfully')
  end

  private

  def add_default_breadcrumb
    add_breadcrumb I18n.t('breadcrumb.roles'), roles_path
  end

  def find_resource
    @role ||= Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:id, :name)
  end

  def permission_to_hash(permissions)
    options = {}
    permissions.each do |key, value|
      options[key] = value.keys
    end
    options
  end
end
