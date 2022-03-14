class Book_creator
  @title = "unknown"
  @author = "unknown"

  def create_book(array)
    print 'Title :'
    @title = gets.chomp
    print 'Author :'
    @author = gets.chomp
    array << Book.new(@title, @author)
    puts "Book created successfully"
  end

end 