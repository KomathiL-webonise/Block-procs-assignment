require_relative 'dynamic_validator'

class User
  attr_accessor :username, :email, :password
  attr_reader :errors

  def initialize
    @errors = []
  end
end

rules = {
  presence: {
    username: {},
    email: {},
    password: {}
  },
  length: {
    username: { minimum: 3, maximum: 20 },
    password: { minimum: 8 }
  }
}

DynamicValidator.generate_validations(User, rules)

user = User.new
user.username = "john"
user.password = "password"

user.validate_presence_of_username
user.validate_length_of_username
user.validate_presence_of_password
user.validate_length_of_password

puts user.errors.inspect

