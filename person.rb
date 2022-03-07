Class Person
attr_reader : id
attr_reader : age
attr_writer : age
attr_reader : name
attr_writer : name
def initialize(name= "Unknow", age, parent_permission : true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission

  def can_use_services?
   if is_of_age? || @parent_permission
      true
    else
      false
   end  
  end

  private

  def is_of_age
    if @age >= 18
      true
    else
      false
    end
  end
end
