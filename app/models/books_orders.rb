class BooksOrders < ActiveRecord::Base
    belongs_to :order
    belongs_to :book
end