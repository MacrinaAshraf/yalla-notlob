class GroupsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  helper_method :current_user

  def current_user
    @current_user = User.find_by(email).where(user_id: current_user.id)
  end

  def index
    @group = Group.new
    @group = Group.where(user_id: current_user.id)
  end

  def create
    @group = Group.create(group_params, user_id: current_user.id)
    flash[:notice] = "Group successfully created"
    redirect_to :groups
  end

  def show
    @group = Group.find(params[:id])
    @current_user = params[:search]
    @users = User.all.where("email LIKE :search", search: @current_user)

  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = " Group successfully deleted"
    redirect_to :groups
  
  end

  private

    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
