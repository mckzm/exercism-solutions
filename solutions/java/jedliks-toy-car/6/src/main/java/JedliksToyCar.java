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
        return DISTANCE_DISPLAY_TEMPLATE.formatted(distanceDrivenInMeters);
    }

    public String batteryDisplay() {
        return isBatteryEmpty()
            ? BATTERY_EMPTY_DISPLAY_MSG
            : BATTERY_DISPLAY_TEMPLATE.formatted(batteryChargePercentage);
    }

    public void drive() {
        if (!isBatteryEmpty()) {
            distanceDrivenInMeters += 20;
            batteryChargePercentage--;
        }
    }

    private boolean isBatteryEmpty() {
        return batteryChargePercentage <= 0;
    }
}
