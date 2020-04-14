class GroupsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  
  def index
    @group = Group.new
    @group = Group.where(user_id: current_user.id)
  end

  def create
    @new_group = Group.new
    @new_group.user_id = current_user.id
    @new_group.name = params[:name]
    @new_group.save
    if @new_group.persisted?
      flash[:notice] = "Group successfully created"
      redirect_to :groups
    end
  end

  def show
    

  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    # flash[:notice] = " Group successfully deleted"
    redirect_to :groups
  
  end

  private

    def set_group
      @group = Group.find(params[:id])
    end

end
