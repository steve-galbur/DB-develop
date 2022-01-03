BooksOrders.delete_all
Order.delete_all
Review.delete_all
Customer.delete_all
Book.delete_all
Author.delete_all

(0..50).each do
    book=Book.create(
        :title => Faker::Lorem.sentence(word_count: 3),
        :year_published => 2021,
        :isbn => "dsaf",
        :price => 50,
        :out_of_print => false,
        :views => 500,
        :supplier => Supplier.create(:name => Faker::Name.name),
        :author => Author.create(
            :first_name => Faker::Name.first_name,
            :last_name => Faker::Name.last_name,
            :title => Faker::Lorem.sentence(word_count: 3),
            :email => Faker::Internet.email,
        )
    )

    customer = Customer.create(
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :title => Faker::Lorem.sentence(word_count: 3),
        :email => Faker::Internet.email,
        :visits => Faker::Number.within(range: 1000..9999),
        :orders_count => Faker::Number.within(range: 1..9)
    )

     Review.create(
            :title => Faker::Lorem.sentence(word_count: 3),
            :body => Faker::Lorem.sentence(word_count: 3),
            :rating => Faker::Number.within(range: 1000..9999),
            :state => 0,
            :customer => customer,
            :book => book
    )

    order = Order.create(
        :date_submitted => Time.now.strftime("%H:%M:%S"),
        :status => 0,
        :subtotal => Faker::Number.within(range: 10..99),
        :shipping => Faker::Number.within(range: 10..99),
        :tax => Faker::Number.within(range: 10..99),
        :total => Faker::Number.within(range: 10..99),
        :customer => customer
    )

    BooksOrders.create(
        :order => order,
        :book => book
    )

end

Appointment.delete_all
Physician.delete_all
Patient.delete_all
Status.delete_all

Status.create(name: 'Active', active: true)
Status.create(name: 'Inactive', active: false)
(0..5).each do
    Appointment.create(
        :physician => Physician.create(:name => Faker::Name.name,:email => Faker::Internet.email),
        :patient => Patient.create(:name => Faker::Name.name,:email => Faker::Internet.email),
        :status  => Status.all.sample
    )
end
