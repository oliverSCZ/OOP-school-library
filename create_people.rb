class People
  @age = 0
  @name = 'unknown'

  def create_person(array)
    puts 'Do you want to create a student (1) or a teacher(2)? [Input the number]:'
    selection = gets.chomp.to_i
    array << create_student if selection == 1
    array << create_teacher if selection == 2
  end

  def basic_info
    print 'Age :'
    @age = gets.chomp
    print 'Name :'
    @name = gets.chomp
  end

  def create_student
    basic_info
    classroom = 'Unknown'
    print 'Has parent permission? [Y/N]:'
    permission_stu = gets.chomp
    parent_permission = permission_stu == 'Y'
    puts 'Person created successfully'
    Student.new(@age, classroom, @name, parent_permission)
  end

  def create_teacher
    basic_info
    print 'Specialization :'
    specialization_t = gets.chomp
    puts 'Person created successfully'
    Teacher.new(specialization_t, @name, @age)
  end
end
