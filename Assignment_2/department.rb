class Department
  attr_accessor :name, :department_head, :employees
  
  def initialize(name, department_head)
    @name = name
    @department_head = department_head
    @employees = []
  end
end

  