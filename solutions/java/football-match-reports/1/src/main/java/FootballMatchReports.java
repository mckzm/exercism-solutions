public class FootballMatchReports {    
    public static String onField(int shirtNum) {
        String description = switch (shirtNum) {
            case 1:
                yield "goalie";
            case 2:
                yield "left back";
            case 3, 4:
                yield "center back";
            case 5:
                yield "right back";
            case 6, 7, 8:
                yield "midfielder";
            case 9:
                yield "left wing";
            case 10:
                yield "striker";
            case 11:
                yield "right wing";
            default:
                yield "invalid";
        };

        return description;
    }
}
