public class JedliksToyCar {
    public static String BATTERY_EMPTY_DISPLAY_MSG = "Battery empty";
    public static String BATTERY_DISPLAY_TEMPLATE = "Battery at %s%%";
    public static String DISTANCE_DISPLAY_TEMPLATE = "Driven %s meters";
    
    private int batteryChargePercentage = 100;
    private int distanceDrivenInMeters;
    
    public static JedliksToyCar buy() {
        return new JedliksToyCar();
    }

    public String distanceDisplay() {
        return String.format(DISTANCE_DISPLAY_TEMPLATE, distanceDrivenInMeters);
    }

    public String batteryDisplay() {
        if (isBatteryEmpty()) return BATTERY_EMPTY_DISPLAY_MSG;
        return String.format(BATTERY_DISPLAY_TEMPLATE, batteryChargePercentage);
    }

    public void drive() {
        if (isBatteryEmpty()) return;
        distanceDrivenInMeters += 20;
        batteryChargePercentage--;
    }

    private boolean isBatteryEmpty() {
        return batteryChargePercentage == 0;
    }
}
