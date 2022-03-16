class Rental
  attr_accessor :date, :book, :person, :id

  def initialize(date, book, person, id:nil)
    @date = date
    @id = id || Random.rand(1..1000)
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end
end
