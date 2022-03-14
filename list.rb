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
    end
    puts
  end
end