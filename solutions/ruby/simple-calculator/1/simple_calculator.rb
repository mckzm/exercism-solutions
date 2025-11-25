class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError unless first_operand.class == Integer
    raise ArgumentError unless second_operand.class == Integer

    if ALLOWED_OPERATIONS.include? operation
      begin
        result = first_operand.send operation.to_sym, second_operand
        "#{first_operand} #{operation} #{second_operand} = #{result}"
      rescue ZeroDivisionError
        "Division by zero is not allowed."
      end
    else
      raise UnsupportedOperation.new
    end
  end

  class UnsupportedOperation < StandardError; end

end
