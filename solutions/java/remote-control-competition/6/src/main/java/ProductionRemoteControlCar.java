class ProductionRemoteControlCar implements RemoteControlCar, Comparable<ProductionRemoteControlCar> {
    private static final int DISTANCE_PER_DRIVE = 10;
    
    private int distanceTravelled;
    private int numberOfVictories;

    public void drive() {
        distanceTravelled += DISTANCE_PER_DRIVE;
    }

    public int getDistanceTravelled() {
        return distanceTravelled;
    }

    public int getNumberOfVictories() {
        return numberOfVictories;
    }

    public void setNumberOfVictories(int numberOfVictories) {
        this.numberOfVictories = numberOfVictories;
    }

    @Override
    public int compareTo(ProductionRemoteControlCar other) {
        return Integer.compare(
            this.getNumberOfVictories(),
            other.getNumberOfVictories()
        );
    }
}
