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
    attr_accessor :name, :age, :designation

    def initialize(name, age, designation)
      @name = name
      @age = age
      @designation = designation
    end

    def to_s
      "#{name}, Age: #{age}, Designation: #{designation}"
    end
  end

  class Department
    attr_accessor :name, :head, :employees

    def initialize(name, head)
      @name = name
      @head = head
      @employees = []
    end

    def add_employee(employee)
      @employees << employee
    end

    def to_s
      "#{name} Department - Head: #{head}\nEmployees:\n#{employees.join("\n")}"
    end
  end

  class Project
    attr_accessor :name, :department, :description

    def initialize(name, department, description)
      @name = name
      @department = department
      @description = description
    end

    def to_s
      "#{name} (#{department}):\n#{description}"
    end
  end

  class Company
    attr_accessor :name, :departments, :projects

    def initialize(name)
      @name = name
      @departments = {}
      @projects = []
    end

    def add_department(department)
      @departments[department.name] = department
    end

    def add_project(project)
      @projects << project
    end

    def to_s
      result = "#{name} Company\n\n"
      result += "Departments:\n"
      departments.each_value { |dept| result += "#{dept}\n\n" }
      result += "Projects:\n"
      projects.each { |project| result += "#{project}\n\n" }
      result
    end
  end


  company = Company.new("TVM infotech")

  # Employees
  emp1 = Employee.new("John Doe", 30, "Software Engineer")
  emp2 = Employee.new("Jane Smith", 35, "Marketing Manager")

  # Departments
  dept_hr = Department.new("HR", "HR Head Name")
  dept_hr.add_employee(emp2)

  dept_eng = Department.new("Engineering", "Engineering Head Name")
  dept_eng.add_employee(emp1)

  company.add_department(dept_hr)
  company.add_department(dept_eng)

  # Projects
  proj1 = Project.new("Project A", "Engineering", " Project A")
  proj2 = Project.new("Project B", "Marketing", "Project B")

  company.add_project(proj1)
  company.add_project(proj2)

  # Print Company Details
  puts "Company name: #{company}"