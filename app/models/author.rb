class Author < ActiveRecord::Base
    has_many :books, -> { order(year_published: :desc) }
end