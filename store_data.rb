require 'json'

class StoreData
  def self.save_books(data)
    saved_books = []
    data.each do |book|
      saved_books << { id: book.id, title: book.title, author: book.author }
    end
    File.write('data/books.json', JSON.generate(saved_books))
  end

  def self.recover_books
    avilable_books = []
    JSON.parse(File.read('data/books.json')).each do |book|
      avilable_books << Book.new(book['title'], book['author'], id: book['id'])
    end
    avilable_books
  end

  def self.save_people(data)
    saved_people = []
    data.each do |person|
      case person.class.to_s
      when 'Student'
        saved_people << { type: person.class, age: person.age, name: person.name,
                          parent_permission: person.parent_permission, id: person.id }
      when 'Teacher'
        saved_people << { type: person.class, specialization: person.specialization, age: person.age, name: person.name,
                          id: person.id }
      end
    end
    File.write('data/people.json', JSON.generate(saved_people))
  end

  def self.recover_people
    available_people = []
    JSON.parse(File.read('data/people.json')).each do |person|
      case person['type']
      when 'Student'
        available_people << Student.new(person['age'], person['name'], person['parent_permission'], id: person['id'])
      when 'Teacher'
        available_people << Teacher.new(person['specialization'], person['name'], person['age'], id: person['id'])
      end
    end
    available_people
  end

  def self.save_rentals(data)
    saved_rentals = []
    data.each do |rental|
      saved_rentals << { id: rental.id, book: rental.book.id, person: rental.person.id,
                         date: rental.date }
    end
    File.write('data/rentals.json', JSON.generate(saved_rentals))
  end

  def self.recover_rentals(books, people)
    available_rentals = []
    JSON.parse(File.read('data/rentals.json')).each do |rental|
      available_rentals << Rental.new(rental['date'], books.find do |book|
                                                        book.id == rental['book']
                                                      end, people.find do |person|
                                                             person.id == rental['person']
                                                           end, id: rental['id'])
    end
    available_rentals
  end
end
