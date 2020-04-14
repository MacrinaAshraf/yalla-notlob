class GroupUsersController < ApplicationController
    def create
        @user = User.find_by(email: params[:email])
        @groupUsers = GroupUser.find_by(user_id: @user.id , group_id: params[:group_id])
        if @group.users.exits?(@user.id)
            flash[:friend_error]="friend is already exist in this group"
            redirect_to :group_users
        else
            @groupUsers = GroupUser.create(user_id: @user.id , group_id: params[:group_id])
            flash[:notice] = "user has added successfully in this group"
            redirect_to :group_users
        end
    end

    def destroy
        @groupUser = Group.find(params[:group_id])
        @groupUser.group.users.destroy(User.find(params[:id]))
        redirect_to :group_users
    end
end
