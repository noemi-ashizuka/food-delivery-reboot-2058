require_relative "../views/meal_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def list
    display_meals
  end

  def add
    # Ask the view to ask the user for a name and store it
    name = @meal_view.ask_for("name")
    # Ask the view to ask the user for a price
    price = @meal_view.ask_for("price").to_i
    # Make a new meal instance with the user info
    meal = Meal.new(name: name, price: price)
    # Ask the repository to store the meal
    @meal_repository.create(meal)
  end

  def edit
	  display_meals
	  index = @meal_view.ask_for('number').to_i - 1
	  meal = @meal_repository.all[index]
	  meal.name = @meal_view.ask_for('new name')
	  meal.price = @meal_view.ask_for('new price').to_i
	  @meal_repository.update
	end

	def delete
	  display_meals
	  index = @meal_view.ask_for('number').to_i - 1
	  @meal_repository.destroy(index)
	end

  private

  def display_meals
     # ask the repository to give me the meals instances in an array
     meals = @meal_repository.all
     # ask the view to display the meals
     @meal_view.display(meals)
  end
end
