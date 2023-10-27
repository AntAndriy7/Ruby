class Customer
  attr_accessor :id, :last_name, :first_name, :middle_name, :address, :credit_card, :bank_account

  def initialize(id, last_name, first_name, middle_name, address, credit_card, bank_account)
    @id = id
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @address = address
    @credit_card = credit_card
    @bank_account = bank_account
  end

  def to_s
    "ID: #{@id}, Lastname: #{@last_name}, Name: #{@first_name}, Middlename: #{@middle_name}, Address: #{@address}, Credit Card Number: #{@credit_card}, Bank account number: #{@bank_account}"
  end
end

class CustomerArray
  attr_accessor :customers

  def initialize
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def list_customers_alphabetically
    @customers.sort_by! { |customer| customer.last_name }
  end

  def customers_with_credit_card_in_range(min_range, max_range)
    @customers.select { |customer| customer.credit_card.to_i >= min_range && customer.credit_card.to_i <= max_range }
  end
end

def main
  customer1 = Customer.new(1, "B", "B", "B", "AddressB", "1234", "1122334455")
  customer2 = Customer.new(2, "A", "A", "A", "AddressA", "9876", "5544332211")
  customer3 = Customer.new(3, "C", "C", "C", "AddressC", "3333", "9911882277")

  customer_array = CustomerArray.new
  customer_array.add_customer(customer1)
  customer_array.add_customer(customer2)
  customer_array.add_customer(customer3)
  
  puts "Customers:"
  customer_array.customers.each { |customer| puts customer.to_s }

  puts "Select action:"
  puts "1. Print a list of customers in alphabetical order"
  puts "2. Print a list of customers with credit card numbers in a given interval"

  choice = gets.chomp.to_i

  case choice
  when 1
    customer_array.list_customers_alphabetically.each { |customer| puts customer.to_s }
  when 2
    puts "Enter the minimum credit card number:"
    min_range = gets.chomp.to_i
    puts "Enter the maximum credit card number:"
    max_range = gets.chomp.to_i

    customers_in_range = customer_array.customers_with_credit_card_in_range(min_range, max_range)
    customers_in_range.each { |customer| puts customer.to_s }
  else
    puts "Incorrect choice!"
  end
end

main
