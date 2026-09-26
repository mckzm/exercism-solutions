class NeedForSpeed {
    private  int batteryChargePercentage = 100;
    private final int batteryDrain;
    private int metersDriven;
    private final int speed;
    
    
    NeedForSpeed(int speed, int batteryDrain) {
        this.speed = speed;
        this.batteryDrain = batteryDrain;
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
        while (!car.batteryDrained()) car.drive();
        return car.distanceDriven() >= distance;
    }
}
