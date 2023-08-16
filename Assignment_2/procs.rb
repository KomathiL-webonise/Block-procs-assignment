def count_even_numbers(array)
  count = 0
  array.each do |num|
    count += 1 if num.even?
  end
  count
end
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "Count of even numbers: #{count_even_numbers(numbers)}"
#using Procs
count_even = Proc.new { |num| num.even? }
def count_numbers(array, condition)
array.count(&condition)
end
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "Count of even numbers: #{count_numbers(numbers, count_even)}"
#using lambda
count_even = lambda { |num| num.even? }
def count_numbers(array, condition)
array.count(&condition)
end
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "Count of even numbers: #{count_numbers(numbers, count_even)}"

# Project Class
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
