class App
  def initialize()
    @list_books = StoreData.recover_books
    @list_persons = StoreData.recover_people
    @list_rentals = StoreData.recover_rentals(@list_books, @list_persons)
  end

  def menu
    # StoreData.get_rentals(@list_books, @list_persons)
    puts "\nPlease choose an option by enterin a number :
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
    when '2'
      List.new.list_items('people', @list_persons)
    when '3'
      People.new.create_person(@list_persons)
    when '4'
      BookCreator.new.create_book(@list_books)
    when '5'
      CreateRental.new.add_rental(@list_rentals, @list_books, @list_persons)
    when '6'
      List.new.list_items('rentals', @list_persons)
    when '7'
      exit_app
    else
      "We don't have this option : #{option}"
    end
    menu
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def exit_app
    StoreData.save_books(@list_books)
    StoreData.save_people(@list_persons)
    StoreData.save_rentals(@list_rentals)
    exit
  end

  def run
    menu
  end
end
require './store_data'
require './create_rental'
require './create_people'
require './create_book'
require './list'
require './rental'
require './teacher'
require './person'
require './student'
require './book'
require './main'
