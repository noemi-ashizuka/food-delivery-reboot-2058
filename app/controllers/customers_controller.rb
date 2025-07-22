require_relative "../views/customer_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def list
    display_customers
  end

  def add
    # Ask the view to ask the user for a name and store it
    name = @customer_view.ask_for("name")
    # Ask the view to ask the user for a price
    address = @customer_view.ask_for("address")
    # Make a new customer instance with the user info
    customer = Customer.new(name: name, address: address)
    # Ask the repository to store the customer
    @customer_repository.create(customer)
  end

  def edit
	  display_customers
	  index = @customer_view.ask_for('number').to_i - 1
	  customer = @customer_repository.all[index]
	  customer.name = @customer_view.ask_for('new name')
	  customer.address = @customer_view.ask_for('new address')
	  @customer_repository.update
	end

	def delete
	  display_customers
	  index = @customer_view.ask_for('number').to_i - 1
	  @customer_repository.destroy(index)
	end

  private

  def display_customers
    customers = @customer_repository.all
    @customer_view.display(customers)
  end
end
