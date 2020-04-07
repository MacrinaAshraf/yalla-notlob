class GroupsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
<<<<<<< HEAD
  def index
    @group = Group.new
    @groups = Group.all()
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    # if params[:search].blank?  
    #   redirect_to( groups_path , alert: "Empty field!") and return  
    # else  
      @group = params[:search]
      @results = Group.all.where("lower(name) LIKE :search", search: @group)  
    # end
  end
=======
  # def index
  #   @groups = Group.all
  # end

  # GET /groups/1
  # GET /groups/1.json
  # def show
  # end
>>>>>>> 4ce01486e80e80f06313e641caeebfc2b17b5e98

  # GET /groups/new
  # def new
  #   @group = Group.new
  # end

  # GET /groups/1/edit
  # def edit
  # end

  # POST /groups
  # POST /groups.json
<<<<<<< HEAD
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
=======
  # def create
  #   @group = Group.new(group_params)

  #   respond_to do |format|
  #     if @group.save
  #       format.html { redirect_to @group, notice: 'Group was successfully created.' }
  #       format.json { render :show, status: :created, location: @group }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @group.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  # def update
  #   respond_to do |format|
  #     if @group.update(group_params)
  #       format.html { redirect_to @group, notice: 'Group was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @group }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @group.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
>>>>>>> 4ce01486e80e80f06313e641caeebfc2b17b5e98

  # DELETE /groups/1
  # DELETE /groups/1.json
  # def destroy
  #   @group.destroy
  #   respond_to do |format|
  #     format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
    # Use callbacks to share common setup or constraints between actions.
    # def set_group
    #   @group = Group.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
<<<<<<< HEAD
    def group_params
      params.require(:group).permit(:name)
    end
=======
    # def group_params
    #   params.fetch(:group, {})
    # end
>>>>>>> 4ce01486e80e80f06313e641caeebfc2b17b5e98
end
