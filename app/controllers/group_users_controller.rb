class GroupUsersController < ApplicationController
    def create
        @user = User.find_by(email: params[:email])
        @group = Group.find(params[:id])
        @groupUsers = GroupUser.find_by(user_id: @user.id , group_id: @group.id)
        if @group.users.exits?(@user.id)
            flash[:friend_error]="friend is already exist in this group"
            redirect_to :groups
        else
            @groupUser = GroupUser.create(user_id: @user.id , group_id: @group.id)
            flash[:notice] = "user has added successfully in this group"
            redirect_to :groups
        end
    end

    def destroy
    end
end
