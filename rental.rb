class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
