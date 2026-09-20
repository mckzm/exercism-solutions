import java.util.Arrays;

class BirdWatcher {
    private static final int[] BIRDS_SEEN_LAST_WEEK = {0, 2, 5, 3, 7, 8, 4};
    private static final int BIRDS_SEEN_ON_BUSY_DAY = 5;
    private final int[] birdsPerDay;

    public BirdWatcher(int[] birdsPerDay) {
        this.birdsPerDay = birdsPerDay.clone();
    }

    public static int[] getLastWeek() {
        return BIRDS_SEEN_LAST_WEEK;
    }

    public int getToday() {
        return birdsPerDay[birdsPerDay.length - 1];
    }

    public void incrementTodaysCount() {
        birdsPerDay[birdsPerDay.length - 1]++;
    }

    public boolean hasDayWithoutBirds() {
        return Arrays.stream(birdsPerDay).anyMatch(birds -> birds == 0);
    }

    public int getCountForFirstDays(int numberOfDays) {
        return Arrays.stream(birdsPerDay)
                     .limit(numberOfDays)
                     .sum();
    }

    public int getBusyDays() {
        return (int) Arrays.stream(birdsPerDay)
                     .filter(birds -> birds >= BIRDS_SEEN_ON_BUSY_DAY)
                     .count();
    }
}
