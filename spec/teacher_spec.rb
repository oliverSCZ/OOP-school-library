require './teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('test specialty', 'test teacher', 99)
  end

  it 'Adds name, age, and specialization correcty to instances' do
    specialization = @teacher.specialization
    age = @teacher.age
    name = @teacher.name
    expect([specialization, name, age]).to eq ['test specialty', 'test teacher', 99]
  end

  it 'All Teacher instances can_use_services? method returns true' do
    second_instance = Teacher.new('test specialty 2', 'test teacher 2', 98)
    expect([@teacher.can_use_services?, second_instance.can_use_services?]).to eq [true, true]
  end
end
