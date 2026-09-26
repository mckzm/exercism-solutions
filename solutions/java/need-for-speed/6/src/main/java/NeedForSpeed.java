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
        return this.speed;
    }

    public int getBatteryDrain() {
        return this.batteryDrain;
    }

    public boolean batteryDrained() {
        return this.batteryChargePercentage < this.batteryDrain;
    }

    public int distanceDriven() {
        return this.metersDriven;
    }

    public void drive() {
        if (!batteryDrained()) {
            this.metersDriven += speed;
            this.batteryChargePercentage -= batteryDrain;
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
        return Math.ceilDiv(distance, car.getSpeed()) <= Math.ceilDiv(100, car.getBatteryDrain());
    }
}
