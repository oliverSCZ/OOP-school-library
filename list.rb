class List 

  def list_items(type, list)
    if type == 'people'
      list.each do |person|
        puts "#{list.index(person)}) [#{person.class}] Name : #{person.name}, ID : #{person.id}, Age: #{person.age}"
      end
    elsif type == 'books'
        list.each do |book|
          puts "#{list.index(book)}) Title : #{book.title}, Author : #{book.author}\n"
        end
    elsif type == 'rentals'
      print "\nID of person:"
      person_id = gets.chomp.to_i
      puts "\nRentals:"
      list.find { |person| person.id == person_id }.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
        end
    end
  end
end