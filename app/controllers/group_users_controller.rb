class GroupUsersController < ApplicationController
    def create
        @user = User.find_by(email: params[:email])
        p @user
        if @user.present?
            @group_user = Group.find(params[:group_id]).group_users.create(user_id: @user.id)
            p @group_user
            redirect_to group_path(params[:group_id])
        end
    end

    def destroy
        @group_user = GroupUser.find(params[:id])
        @group_user.destroy
        redirect_to group_path(params[:group_id])
    end
end
