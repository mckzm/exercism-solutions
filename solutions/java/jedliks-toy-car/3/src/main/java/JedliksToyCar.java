public class JedliksToyCar {
    private int batteryChargePercentage = 100;
    private int distanceDrivenInMeters;
    
    public static JedliksToyCar buy() {
        return new JedliksToyCar();
    }

    public String distanceDisplay() {
        return "Driven " + distanceDrivenInMeters + " meters";
    }

    public String batteryDisplay() {
        if (isBatteryEmpty()) return "Battery empty";
        return "Battery at " + batteryChargePercentage + "%";
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
