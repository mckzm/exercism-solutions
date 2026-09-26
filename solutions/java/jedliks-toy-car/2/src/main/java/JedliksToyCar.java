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
        if (batteryChargePercentage <= 0) return "Battery empty";
        return "Battery at " + batteryChargePercentage + "%";
    }

    public void drive() {
        if (batteryChargePercentage <= 0) return;
        distanceDrivenInMeters += 20;
        batteryChargePercentage -= 1;
    }
}
