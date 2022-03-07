require '/person'

Class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end