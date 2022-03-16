require './classroom'
require './student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('room_A')
    @student = Student.new(10, 'test student', 'unkwown_classroom')
  end

  it 'Adds correct label to Classroom instance' do
    label = @classroom.label
    expect(label).to eq 'room_A'
  end

  it 'Adds student to Classroom correctly' do
    @classroom.add_student(@student)
    expect(@student.classroom).to eq @classroom
  end
end
