
require 'csv'
require_relative 'employee'
require_relative 'department'

class Company
  def initialize
    @departments = []
  end
  
  def add_department(name, department_head)
    department = Department.new(name, department_head)
    @departments << department
  end
  
  def add_employee(employee)
    department = @departments.find { |dept| dept.name == employee.department }
    if department
      department.employees << employee
    else
      puts "Department not found!"
    end
  end
  
  def hr
    @departments.find { |dept| dept.name == 'HR' }
  end
  
  def department_heads
    @departments.map(&:department_head)
  end
  
  def save_employee_data_to_csv(filename)
    CSV.open(filename, 'w') do |csv|
      csv << ['Name', 'Age', 'Department', 'Division', 'Designation']
      @departments.each do |department|
        department.employees.each do |employee|
          csv << [employee.name, employee.age, employee.department, employee.division, employee.designation]
        end
      end
    end
  end
end

# Example usage
company = Company.new

company.add_department('HR', 'HR Department Head')
company.add_department('Engineering', 'Engineering Department Head')
# Add more departments and department heads

employee1 = Employee.new('John Doe', 30, 'HR', 'Recruitment', 'HR Specialist')
employee2 = Employee.new('Jane Smith', 28, 'HR', 'Recruitment', 'Software Engineer')
# Add more employees

company.add_employee(employee1)
company.add_employee(employee2)
# Add more employees

company.save_employee_data_to_csv('employee_data.csv')
