class Create_rental
    @book_list = []
    @people_list = []
    @date = ''
    @select_book_rent = 0
    @select_person_rent = 0

    def add_rental(array, books, people)
        @book_list = books
        @people_list = people
        if check_lists 
            array << create_rent if check_lists
            puts "\nRental created succesfully!"
        else
        false
        end
    end
    
    def select_objects
        puts 'Select a book from the following list by number:'
        @book_list.each do |book|
          puts "#{@book_list.index(book)}) Title : #{book.title}, Author : #{book.author}\n"
        end
        @select_book_rent = gets.chomp.to_i
        puts "\nSelect a person from the following list by number (not id):"
        @people_list.each do |person|
          puts "#{@people_list.index(person)}[#{person.class}] Name : #{person.name}, ID : #{person.id}, Age: #{person.age}"
        end
        @select_person_rent = gets.chomp.to_i
        print 'Date:'
        @date = gets.chomp
    end

    def create_rent
        select_objects
        Rental.new(@date, @book_list[@select_book_rent], @people_list[@select_person_rent])
    end

    def check_lists
        if @book_list.length.zero?
            puts "Could you create a book first, please?"
            false
        elsif @people_list.length.zero?
            puts "There is no one person to rent a book, could you create a person first, please?"
            false
        else
            true
        end
    end
end