public class CarsAssemble {
    private static final int BASE_PRODUCTION_RATE = 221;
    private static final int MINUTES_PER_HOUR = 60;

    public double productionRatePerHour(int speed) {
        return speed * this.actualProductionRate(speed);
    }

    public int workingItemsPerMinute(int speed) {
        return (int) this.productionRatePerHour(speed) / MINUTES_PER_HOUR;
    }

    private double actualProductionRate(final int speed) {
        if (speed == 0) {
            return 0;
        }
        else if (speed < 5) {
            return BASE_PRODUCTION_RATE;
        } else if (speed < 9) {
            return BASE_PRODUCTION_RATE * 0.9;
        } else if ( speed == 9) {
            return BASE_PRODUCTION_RATE * 0.8;
        } else {
            return BASE_PRODUCTION_RATE * 0.77;
        }
    }
}
