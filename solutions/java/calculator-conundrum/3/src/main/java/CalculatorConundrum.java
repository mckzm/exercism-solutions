class CalculatorConundrum {
    public String calculate(int operand1, int operand2, String operation) {
        int result = switch (operation) {
            case null -> throw new IllegalArgumentException("Operation cannot be null");
            case "" -> throw new IllegalArgumentException("Operation cannot be empty");
            case "+" -> operand1 + operand2;
            case "*" -> operand1 * operand2;
            case "/" -> {
                try {
                    yield operand1 / operand2;
                } catch (ArithmeticException e) {
                    throw new IllegalOperationException("Division by zero is not allowed", e);
                }
            }
            default -> throw new IllegalOperationException(String.format("Operation '%s' does not exist", operation));
        };

        return "%d %s %d = %d".formatted(operand1, operation, operand2, result);
    }
}
