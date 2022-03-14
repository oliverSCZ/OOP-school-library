class App
  def initialize()
    @list_books = []
    @list_persons = []
    @list_rentals = []
  end

  def menu
    puts "Please choose an option by enterin a number :
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit"
    selection
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def selection
    option = gets.chomp
    case option
    when '1'
      List.new.list_items('books', @list_books)
      menu
    when '2'
      List.new.list_items('people', @list_persons)
      menu
    when '3'
      People.new.create_person(@list_persons)
      menu
    when '4'
      Book_creator.new.create_book(@list_books)
      menu
    when '5'
      create_a_rental
    when '6'
      list_all_rentals_id
    when '7'
      exit
    else
      "We don't have this option : #{option}"
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  # rubocop:disable Metrics/MethodLength
  def create_a_rental
    if @list_books.length.zero?
      puts 'Could you create a book first, please.'
      menu
    else
      puts 'Select a book from the following list by number:'
      @list_books.each do |book|
        puts "#{@list_books.index(book)}) Title : #{book.title}, Author : #{book.author}\n"
      end

    end
    select_book_rent = gets.chomp.to_i
    if @list_persons.length.zero?
      puts 'there is no one person for rent a book, could you create a person first, please.\n'
      menu
    else
      puts "\nSelect a person from the following list by number (not id):"
      @list_persons.each do |person|
        puts "#{@list_persons.index(person)}[#{person.class}]
        Name : #{person.name}, ID : #{person.id}, Age: #{person.age}"
      end
    end
    select_person_rent = gets.chomp.to_i
    print 'Date:'
    rental_date = gets.chomp
    @list_rentals << Rental.new(rental_date, @list_books[select_book_rent], @list_persons[select_person_rent])
    puts "\nRental created succesfully!"
    puts
    menu
  end
  # rubocop:enable Metrics/MethodLength

  def list_all_rentals_id
    print "\nID of person:"
    person_id = gets.chomp.to_i
    puts "\nRentals:"
    @list_persons.find { |person| person.id == person_id }.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
    puts
    menu
  end

  def list_all_books
    if @list_books.length.zero?
      puts 'Could you create a book first, please.\n'
    else
      @list_books.each do |book|
        puts "Title : #{book.title}, Author : #{book.author}"
      end
    end
    puts
    menu
  end

  def list_all_persons
    if @list_persons.length.zero?
      puts 'Could you create a person first, please.\n'
    else
      @list_persons.each do |person|
        puts "[#{person.class}] Name : #{person.name}, ID : #{person.id}, Age: #{person.age}"
      end
    end
    menu
  end

  def run
    menu
  end
end
require_relative 'create_people'
require_relative 'create_book'
require_relative 'list'
require_relative 'rental'
require_relative 'teacher'
require_relative 'person'
require_relative 'student'
require_relative 'book'
require_relative 'main'
