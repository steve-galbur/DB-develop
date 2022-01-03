
class Review < ActiveRecord::Base
    belongs_to :customer
    belongs_to :book
  
    enum state: [:not_reviewed, :published, :hidden]
  end