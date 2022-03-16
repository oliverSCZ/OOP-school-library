require './rental'
require './teacher'
require './book'

describe Rental do
  before :each do
    @renting_person = Teacher.new('test specialty', 'test teacher', 99)
    @book = Book.new('title', 'author')
    @date = '01/01/2058'
    @rental = Rental.new(@date, @book, @renting_person)
  end

  it 'Creates instance with correct info' do
    expect([@rental.book, @rental.person, @rental.date]).to eq [@book, @renting_person, @date]
  end

  it 'Add rental to person_renting rentals' do
    person_rentals = @renting_person.rentals.include?(@rental)
    expect(person_rentals).to eq true
  end

  it 'Add rental to book rentals' do
    book_rentals = @book.rentals.include?(@rental)
    expect(book_rentals).to eq true
  end
end
