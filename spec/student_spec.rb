require './student'

describe Student do
  context 'when testing person' do
    it 'creates a new instance of Student' do
      oliver = Student.new(37, false, 'Oliver', 61)
      expect(oliver.name).to eq 'Oliver'
    end

    it 'plays hooky' do
      jorge = Student.new(32, true, 'Jorge')
      expect(jorge.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end
