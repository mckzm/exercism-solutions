import java.util.function.BiConsumer;

class CalculatorConundrum {

    public String calculate(int operand1, int operand2, String operationSymbol) {
        Operation operation = validateAndGetOperation(operand1, operand2, operationSymbol);
        int result = evaluate(operand1, operand2, operation);
        return "%d %s %d = %d".formatted(operand1, operation.getSymbol(), operand2, result);
    }

    private int evaluate(int operand1, int operand2, Operation operation) {
        return switch (operation) {
            case ADD -> operand1 + operand2;
            case MULTIPLY -> operand1 * operand2;
            case DIVIDE -> operand1 / operand2;
        };
    }

    private enum Operation {
        ADD("+", (operand1, operand2) -> {}),
        MULTIPLY("*", (operand1, operand2) -> {}),
        DIVIDE("/", (operand1, operand2) -> {
            if (operand2 == 0) {
                throw new IllegalOperationException("Division by zero is not allowed", new ArithmeticException());
            }
        });

        private final String symbol;
        private final BiConsumer<Integer, Integer> validator;

        Operation(String symbol, BiConsumer<Integer, Integer> validator) {
            this.symbol = symbol;
            this.validator = validator;
        }

        private String getSymbol() {
            return symbol;
        }

        private void validate(int operand1, int operand2) {
            validator.accept(operand1, operand2);
        }

        private static Operation fromSymbol(String symbol) {
            for (Operation operation : values()) {
                if (operation.symbol.equals(symbol)) {
                    return operation;
                }
            }
            throw new IllegalOperationException(String.format("Operation '%s' does not exist", symbol));
        }
    }

    private Operation validateAndGetOperation(int operand1, int operand2, String operationSymbol) {
        if (operationSymbol == null) {
            throw new IllegalArgumentException("Operation cannot be null");
        }
        if (operationSymbol.isEmpty()) {
            throw new IllegalArgumentException("Operation cannot be empty");
        }

        Operation operation = Operation.fromSymbol(operationSymbol);
        operation.validate(operand1, operand2);
        return operation;
    }
}
