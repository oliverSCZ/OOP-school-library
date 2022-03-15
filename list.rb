class List
  # rubocop:disable Metrics/CyclomaticComplexity
  def list_items(type, list)
    case type
    when 'people'
      list.each do |person|
        puts "#{list.index(person)}) [#{person.class}] Name : #{person.name}, ID : #{person.id}, Age: #{person.age}"
      end
    when 'books'
      list.each do |book|
        puts "#{list.index(book)}) Title : #{book.title}, Author : #{book.author}\n"
      end
    when 'rentals'
      print "\nID of person:"
      person_id = gets.chomp.to_i
      puts "\nRentals:"
      list.find { |person| person.id == person_id }.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
