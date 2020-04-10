class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  helper_method :current_user

  # GET /groups
  # GET /groups.json
  def current_user
    @current_user = User.find_by(email).where(user_id:current_user.id)
  end

  def index
    @group = Group.new
    @groups = Group.all()
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @current_user = params[:search]
    @users = User.all.where("lower(email) LIKE :search", search: @current_user)
    return @group , @group.users.create()
  end

  # GET /groups/new
  # def new
  #   @group = Group.new
  # end

  # GET /groups/1/edit
  # def edit
  # end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.create(group_params)
    redirect_to :groups
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    # respond_to do |format|
    #   if @group.update(group_params)
    #     format.html { redirect_to @group, notice: 'Group was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @group }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @group.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name)
    end
end
