class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end
 
  def run
    while @running
      choice = display_menu
      print `clear`
      action(choice)
    end
  end

  private

  def display_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - Edit a meal"
    puts "4 - Delete a meal"
    puts "5 - List all customers"
    puts "6 - Add a customer"
    puts "7 - Edit a customer"
    puts "8 - Delete a customer"
    puts "9 - Quit"
    print "> "
    gets.chomp.to_i
  end

  def action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.delete
    when 5 then @customers_controller.list
    when 6 then @customers_controller.add
    when 7 then @customers_controller.edit
    when 8 then @customers_controller.delete
    when 9 then @running = false
    else
      puts "Try again..."
    end
  end
end
