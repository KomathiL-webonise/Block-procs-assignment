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

# Block
count_using_block = count_even_numbers_block(numbers)
puts "Count of even numbers using block: #{count_using_block}"

# Proc
count_proc = proc { |arr| arr.count(&:even?) }
count_using_proc = count_even_numbers_proc(numbers, count_proc)
puts "Count of even numbers using proc: #{count_using_proc}"

# Lambda
count_lambda = ->(arr) { arr.count(&:even?) }
count_using_lambda = count_even_numbers_lambda(numbers, count_lambda)
puts "Count of even numbers using lambda: #{count_using_lambda}"

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
