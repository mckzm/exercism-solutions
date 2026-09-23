class SqueakyClean {
    static String clean(String identifier) {
        char cleanedUp;
        StringBuilder builder = new StringBuilder();
        boolean camelCaseFlag = false;
        
        for (char c: identifier.toCharArray()) {
            cleanedUp = c;
            
            if (Character.isSpaceChar(c)) {
                cleanedUp = '_';
            } else if (c == '-') {
                camelCaseFlag = true;
                continue;
            } else if (isLeetSpeak(c)) {
                cleanedUp = fromLeetSpeak(c);
            } else if (!Character.isAlphabetic(c)) {
                continue;
            } else {
                if (camelCaseFlag) {
                    cleanedUp = Character.toUpperCase(c);
                    camelCaseFlag = false;
                }
            }

            builder.append(cleanedUp);
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