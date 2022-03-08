require '/person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown')
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
