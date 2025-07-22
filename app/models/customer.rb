class Customer
  attr_accessor :id, :name, :address

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @address = attributes[:address] # string
  end
end
