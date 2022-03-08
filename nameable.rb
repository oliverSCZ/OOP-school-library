class Nameable

def correct_name
  raise NotImplementedError
end

end

class Decorator < Nameable

  def initialize(nameable)
    @nameable = nameable
  end 
  def correct_name
    super()
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
class TrimmerDecorator < Decorator
  def correct_name
  puts @nameable.correct_name[0,10]
  end
end