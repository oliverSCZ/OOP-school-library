require './person'

Class student < person
def initialize(age, classroom, name = 'Unknown', parent_permission: true)
@classroom = classroom
end

def play_hooky
  "¯\(ツ)/¯"
end
end
