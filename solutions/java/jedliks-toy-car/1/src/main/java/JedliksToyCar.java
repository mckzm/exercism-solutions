public class JedliksToyCar {
    private int batteryCharge = 100;
    private int distanceDriven;
    
    public static JedliksToyCar buy() {
        return new JedliksToyCar();
    }

    public String distanceDisplay() {
        return "Driven " + this.distanceDriven + " meters";
    }

    public String batteryDisplay() {
        if (batteryCharge <= 0) return "Battery empty";
        return "Battery at " + batteryCharge + "%";
    }

    public void drive() {
        if (batteryCharge <= 0) return;
        distanceDriven += 20;
        batteryCharge -= 1;
    }
}
