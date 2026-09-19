public class CarsAssemble {
    private static final int BASE_PRODUCTION_RATE = 221;
    private static final int MINUTES_PER_HOUR = 60;

    public double productionRatePerHour(int speed) {
        if (speed <= 0) {
            return 0;
        }

        double actualProductionRate;
        
        if (speed < 5) {
            actualProductionRate = BASE_PRODUCTION_RATE;
        } else if (speed < 9) {
            actualProductionRate = BASE_PRODUCTION_RATE * 0.9;
        } else if ( speed == 9) {
            actualProductionRate = BASE_PRODUCTION_RATE * 0.8;
        } else {
            actualProductionRate = BASE_PRODUCTION_RATE * 0.77;
        }

        return speed * actualProductionRate;
    }

    public int workingItemsPerMinute(int speed) {
        return (int) this.productionRatePerHour(speed) / MINUTES_PER_HOUR;
    }
}
