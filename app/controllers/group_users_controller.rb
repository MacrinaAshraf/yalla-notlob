class GroupUsersController < ApplicationController
    def create
        @user = User.find_by(email: params[:email])
        if @use.present?
            @groupusers = @group.users.create(user_id: @user.id , group_id: params[:group_id])
            redirect_to :group_users
        end
    end

    def destroy
        @groupUser = Group.find(params[:group_id])
        @groupUser.group.users.destroy(User.find(params[:id]))
        redirect_to :group_users
    end
end
