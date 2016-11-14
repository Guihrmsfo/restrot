class Recipe < ApplicationRecord
    belongs_to :user
    
    validate :user_id_exists

    def user_id_exists
      return false if User.find_by_id(self.user_id).nil?
    end
end
