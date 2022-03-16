require './person'

describe Person do
  context 'when testing person' do
    it 'creates a new instance of Person' do
      oliver = Person.new(37, 'Oliver')
      expect(oliver.name).to eq 'Oliver'
    end
  end

  it 'cut the name' do
    oliver = Person.new(37, 'Olivercoimbra')
    oliver.validate_name
    expect(oliver.name.length).to eq 10
  end
end

require './corrector'
