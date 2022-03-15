require 'json'

class StoreData

  def self.save_books(data)
    saved_books = []
    data.each do |book| saved_books << { id: book.id, title: book.title, author: book.author }
      end
    File.write('data/books.json', JSON.generate(saved_books))
  end

  def self.get_books
    avilable_books = []
      JSON.parse(File.read('data/books.json')).each do |book|
        avilable_books << Book.new(book['title'], book['author'], id: book['id'])
      end
      avilable_books
  end

  def self.save_people(data)
    saved_people = []
    data.each do |person| 
      if person.class.to_s == 'Student'
      saved_people << { type: person.class, age: person.age, name: person.name, parent_permission: person.parent_permission, id: person.id }
      elsif person.class.to_s == 'Teacher'
      saved_people << { type: person.class, specialization: person.specialization, age: person.age, name: person.name }
      end  
    end
    File.write('data/people.json', JSON.generate(saved_people))
  end

  def self.get_people
    available_people = []
      JSON.parse(File.read('data/people.json')).each do |person|
        if person['type'] == 'Student'
        available_people << Student.new(person['age'], person['parent_permission'], person['name'], id: person['id'])
        elsif person['type'] == 'Teacher'
        available_people << Teacher.new(person['specialization'], person['name'], person['age'])
        end
      end
      available_people
  end

end