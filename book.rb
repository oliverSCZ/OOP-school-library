class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author, id: nil)
    @title = title
    @author = author
    @rentals = []
    @id = id || Random.rand(1..1000)
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
