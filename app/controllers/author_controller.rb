class AuthorController < ApplicationController
  
    def index
      @author = Author.find(210)
      # Find the customer with primary key (id) 10.
      customer = Customer.find(208)
      #The find method will raise an ActiveRecord::RecordNotFound exception if no matching record is found.


      # Find the customers with primary keys 1 and 10.
      customer = Customer.find([208, 209]) # OR Customer.find(1, 10)


      #The take method retrieves a record without any implicit ordering.
      customer = Customer.take

      #You can pass in a numerical argument to the take method to return up to that number of results. For example
      customers = Customer.take(2)

      #The first method finds the first record ordered by primary key (default). For example:
      customer = Customer.first
      #If your default scope contains an order method, first will return the first record according to this ordering.

      #You can pass in a numerical argument to the first method to return up to that number of results. For example

      customers = Customer.first(3)
      
      #On a collection that is ordered using order, first will return the first record ordered by the specified attribute for order
      customer = Customer.order(:first_name).first

      #The last method finds the last record ordered by primary key (default). For example:
      customer = Customer.last

      #You can pass in a numerical argument to the last method to return up to that number of results. For example
      customers = Customer.last(3)


      #The find_by method finds the first record matching some conditions. For example:
      Customer.find_by first_name: 'Lifo'

      #It is equivalent to writing:
      Customer.where(first_name: 'Lifo').take

      #The find_by! method behaves exactly like find_by, except that it will raise ActiveRecord::RecordNotFound if no matching record is found. For example:
      #Customer.find_by! first_name: 'does not exist'
      #This is equivalent to writing:
      #Customer.where(first_name: 'does not exist').take!

      
      
      #The find_each method retrieves records in batches and then yields each one to the block. In the following example, find_each retrieves customers in batches of 1000 and yields them to the block one by one:
      Customer.find_each do |customer|
       # NewsMailer.weekly(customer).deliver_now
      end

      #This process is repeated, fetching more batches as needed, until all of the records have been processed.

      #find_each works on model classes, as seen above, and also on relations:

      Customer.where(title: "test").find_each do |customer|
        #NewsMailer.weekly(customer).deliver_now
      end

      Book.where("title = ?", "Dicta omnis recusandae a architecto.")

      @books = Book.where("title = ?", "Dicta omnis recusandae a architecto.").includes(:author).all

      #Joins

      book=Book.joins(:author,:reviews).where('authors.first_name' => 'Eliezer').includes(:author,:reviews)
      book=Book.joins(:author,:reviews).where(authors: { first_name: 'Eliezer', last_name: 'Lubowitz'}, reviews: { title: 'Eveniet perspiciatis sit qui maiores in.'}).includes(:author,:reviews)
      @books=Book.includes(:author,:reviews)
    end
  
  end
