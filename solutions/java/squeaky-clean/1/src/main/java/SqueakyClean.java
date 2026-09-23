class SqueakyClean {
    static String clean(String identifier) {
        StringBuilder builder = new StringBuilder();
        boolean camelCaseFlag = false;
        
        for (char c: identifier.toCharArray()) {
            if (Character.isSpaceChar(c)) {
                builder.append('_');
            } else if (c == '-') {
                camelCaseFlag = true;
                continue;
            } else if (Character.isDigit(c) && isLeetSpeak(c)) {
                builder.append(fromLeetSpeak(c));
            } else if (!Character.isAlphabetic(c)) {
                continue;
            } else {
                if (camelCaseFlag) {
                    builder.append(Character.toUpperCase(c));
                    camelCaseFlag = false;
                } else {
                    builder.append(c);
                }
            }
        }

        return builder.toString();
    }

    private static boolean isLeetSpeak(char c) {
        return "01347".indexOf(c) != -1;
    }

    private static char fromLeetSpeak(char c) {
        if (c == '0') return 'o';
        if (c == '1') return 'l';
        if (c == '3') return 'e';
        if (c == '4') return 'a';
        if (c == '7') return 't';
        
        return c;
    }
}
