require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it {should have_many(:dish_ingredients)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  before :each do
    @chef1 = Chef.create!(name: "Mose")
    @dish1 = @chef1.dishes.create!(name: "Spaghetti alla Mose", description: "Spaghetti with meatballs and marinara")
    @ingredient1 = Ingredient.create!(name: "Spaghetti noodles", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Beef meatballs", calories: 300)
    @ingredient3 = Ingredient.create!(name: "Marinara Sauce", calories: 200)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
  end

  describe 'instance methods' do
    describe '#total_calories' do
      it 'calculates total calories for a dish' do
        expect(@dish1.total_calories).to eq(600)
      end
    end
  end
end
