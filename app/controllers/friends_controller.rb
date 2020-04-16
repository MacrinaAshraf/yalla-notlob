class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  def index
    @friend_number = current_user.friends
    @friends = []
    @friend_number.each do |fri|
      users = User.find(fri.friend_id)
      @friends.push(users)
    end

  end

  def new
    @friend = Friend.new
  end

  def create
    user = User.find_by email: params[:email]

    if user.present?
      @friend = Friend.find_by(user_id: current_user.id, friend_id: user.id)
      if !@friend.present?
        @new_friend = Friend.create(user_id: current_user.id, friend_id: user.id)
        Friend.create_notifications()
        respond_to do |format|
          if @new_friend.save
            format.html { redirect_to friends_url, notice: 'Friend was successfully created.'}
          else
            format.html { render :new }
            format.json { render json: @new_friend.errors, status: :unprocessable_entity }
          end
        end
      else
        flash[:notice] = 'Already Friend'
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:notice] = 'user not found'
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend = current_user.friends.find_by(friend_id: params[:id])
    @friend.destroy


    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_friend
    @friend = current_user.friends.find_by(friend_id: params[:id])
  end

  def friend_params
    params.fetch(:friend, {})
  end
end
