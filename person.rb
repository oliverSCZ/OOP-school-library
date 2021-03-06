require './corrector'

class Person
  attr_accessor :age, :name, :rentals
  attr_reader :id

  def initialize(age, name, *, parent_permission: false)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @corrector = Corrector.new
  end

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    name
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end

# require_relative './nameable.rb'
