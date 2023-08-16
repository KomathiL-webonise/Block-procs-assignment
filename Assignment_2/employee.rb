class Employee
  attr_accessor :name, :age, :department, :division, :designation
  
  def initialize(name, age, department, division, designation)
    @name = name
    @age = age
    @department = department
    @division = division
    @designation = designation
  end
end
