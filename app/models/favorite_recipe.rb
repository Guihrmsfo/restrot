class FavoriteRecipe < ApplicationRecord
    belongs_to :user
    
    validates :user_id, :presence => {:message => " deve ser preenchido"}
    validates :uri, :presence => {:message => " deve ser preenchido"}
end
