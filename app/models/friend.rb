class Friend < ApplicationRecord
    before_create :owner
    def owner
        self.user_id = current_user.id
    end
end
