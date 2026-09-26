import static java.lang.Math.ceilDiv;

class NeedForSpeed {
    private final int batteryDrain;
    private final int speed;
    
    private int batteryChargePercentage = 100;
    private int metersDriven;
    
    NeedForSpeed(int speed, int batteryDrain) {
        this.speed = speed;
        this.batteryDrain = batteryDrain;
    }

    public int getSpeed() {
        return speed;
    }

    public int getBatteryDrain() {
        return batteryDrain;
    }

    public boolean batteryDrained() {
        return batteryChargePercentage < batteryDrain;
    }

    public int distanceDriven() {
        return metersDriven;
    }

    public void drive() {
        if (!batteryDrained()) {
            metersDriven += speed;
            batteryChargePercentage -= batteryDrain;
        }
    }

    public static NeedForSpeed nitro() {
        return new NeedForSpeed(50, 4);
    }
}

class RaceTrack {
    private int distance;
    
    RaceTrack(int distance) {
        this.distance = distance;
    }

    public boolean canFinishRace(NeedForSpeed car) {
        return ceilDiv(distance, car.getSpeed()) <= ceilDiv(100, car.getBatteryDrain());
    }
}
