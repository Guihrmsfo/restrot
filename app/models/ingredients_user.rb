class IngredientsUser < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
  
  validates :ingredient_id, :presence => {:message => " deve ser preenchido"}
  validates :quantity, :presence => {:message => " deve ser preenchido"}
  validate :validate_ingredient_id
  

private

  def validate_ingredient_id
      errors.add(:ingredient_id, " invalido") unless Ingredient.exists?(ingredient_id)
  end
end