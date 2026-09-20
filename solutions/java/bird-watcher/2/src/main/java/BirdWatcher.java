
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
        int todaysIndex = this.birdsPerDay.length - 1;
        return this.birdsPerDay[todaysIndex];
    }

    public void incrementTodaysCount() {
        int todaysIndex = this.birdsPerDay.length - 1;
        this.birdsPerDay[todaysIndex]++;
    }

    public boolean hasDayWithoutBirds() {
        for (int birdsOnDay: this.birdsPerDay) if (birdsOnDay == 0) return true;
        return false;
    }

    public int getCountForFirstDays(int numberOfDays) {
        int len = this.birdsPerDay.length;
        if (numberOfDays > len) numberOfDays = len;
        int birdCount = 0;

        for (int i = 0; i < numberOfDays; i++) birdCount += this.birdsPerDay[i];

        return birdCount;
    }

    public int getBusyDays() {
        int busyDays = 0;
        
        for (int birdsOnDay: this.birdsPerDay) {
            if (birdsOnDay >= BIRDS_SEEN_ON_BUSY_DAY) busyDays++;
        }

        return busyDays;
    }
}
