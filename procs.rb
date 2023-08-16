# Use Blocks, Procs and Lambda each to write a program which takes array of integers as an input and finds the count of even numbers in the array
# Method using block
def count_even_numbers_block(arr)
    count = 0
    arr.each { |num| count += 1 if num.even? }
    count
  end

  # Method using proc
  def count_even_numbers_proc(arr, count_proc)
    count_proc.call(arr)
  end

  # Method using lambda
  def count_even_numbers_lambda(arr, count_lambda)
    count_lambda.call(arr)
  end


  numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  #block
  count_using_block = count_even_numbers_block(numbers)
  puts "Count of even numbers using block: #{count_using_block}"

  #proc
  count_proc = proc { |arr| arr.count(&:even?) }
  count_using_proc = count_even_numbers_proc(numbers, count_proc)
  puts "Count of even numbers using proc: #{count_using_proc}"

  #lambda
  count_lambda = ->(arr) { arr.count(&:even?) }
  count_using_lambda = count_even_numbers_lambda(numbers, count_lambda)
  puts "Count of even numbers using lambda: #{count_using_lambda}"

#   Object Orientation
#   Write a program in ruby which represents a single Company which has employees, departments and projects. 
class Employee
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Department
  attr_accessor :name, :department_head, :employees

  def initialize(name, department_head)
    @name = name
    @department_head = department_head
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def employee_count
    @employees.length
  end
end

class Company
  attr_accessor :name, :departments

  def initialize(name)
    @name = name
    @departments = []
  end

  def add_department(department)
    @departments << department
  end
end

# Creating employees
employee1 = Employee.new("John Doe")
employee2 = Employee.new("Jane Smith")

# Creating departments
engineering = Department.new("Engineering", "Engineering Head")
hr = Department.new("HR", "HR Head")

# Adding employees to departments
engineering.add_employee(employee1)
hr.add_employee(employee2)

# Creating a company
company = Company.new("TVM infotech")

# Adding departments to the company
company.add_department(engineering)
company.add_department(hr)

# Displaying company information
puts "Company: #{company.name}"
company.departments.each do |department|
  puts "Department: #{department.name}"
  puts "Department Head: #{department.department_head}"
  puts "Employee Count: #{department.employee_count}"
end
  # Service and Product type projects 
  class Project
    attr_accessor :name, :department, :description, :project_type
  
    def initialize(name, department, description, project_type)
      @name = name
      @department = department
      @description = description
      @project_type = project_type
    end
  
    def calculate_profit(revenue)
      if project_type == "Service"
        revenue * 0.7 # Calculate profit for service project
      elsif project_type == "Product"
        revenue * 0.5 # Calculate profit for product project
      else
        raise "Invalid project type"
      end
    end
  
    def to_s
      "#{name} (#{department}, #{project_type}):\n#{description}"
    end
  end


  proj1 = Project.new("Project A", "Engineering", "Project A", "Service")
revenue = 100000 
profit = proj1.calculate_profit(revenue)
puts "Profit for #{proj1.name}: #{profit}"
  