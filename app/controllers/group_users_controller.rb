class GroupUsersController < ApplicationController
    def create
        @user = User.find_by(email: params[:email])
        @group = Group.find(params[:id])
        @groupUsers = GroupUser.find_by(user_id: @user.id , group_id: @group.id)
        if (@user.id != current_user.id && @user.present?)
            @groupUser = GroupUser.create(user_id: @user.id , group_id: @group.id)
        end
        flash[:notice] = "user has added successfully in this group"
        redirect_to : groups
    end

    def destroy
    end
end
