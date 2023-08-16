class DynamicValidator
  def self.generate_validations(target_class, validation_rules)
    validation_rules.each do |rule, attributes|
      attributes.each do |attribute, options|
        define_validation_method(target_class, rule, attribute, options)
      end
    end
  end

  def self.define_validation_method(target_class, rule, attribute, options)
    validation_method_name = "validate_#{rule}_of_#{attribute}"

    target_class.class_eval do
      define_method(validation_method_name) do
        value = send(attribute)
        
        case rule
        when :presence
          if value.nil? || (value.is_a?(String) && value.strip.empty?)
            errors.add(attribute, "can't be blank")
          end
        when :length
          if options[:minimum] && value.to_s.length < options[:minimum]
            errors.add(attribute, "is too short (minimum #{options[:minimum]} characters)")
          end
          if options[:maximum] && value.to_s.length > options[:maximum]
            errors.add(attribute, "is too long (maximum #{options[:maximum]} characters)")
          end
        # Add more validation rules here
        end
      end
    end
  end
end
