# frozen_string_literal: true

Class Person
attr_reader :id
attr_reader :age
attr_writer :age
attr_reader :name
attr_writer :name

def initialize(age, name = 'Unknown', parent_permission: true)
  @id = Random.rand(1..1000)
  @name = name
  @age = age
  @parent_permission = parent_permission

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
