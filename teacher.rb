require_relative 'person'

class Teacher < Person
  
  attr_reader :specialization
  def initialize(specialization, *, age, name, id:nil)
    super(name, age)
    @specialization = specialization
    @id = id || Random.rand(1..1000)
  end

  def can_use_services?
    true
  end
end
