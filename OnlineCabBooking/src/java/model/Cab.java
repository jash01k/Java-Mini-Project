package model;

public class Cab {
    private String name;
    private String pickup;
    private String drop;
    private String cabType;

    public Cab(String name, String pickup, String drop, String cabType) {
        this.name = name;
        this.pickup = pickup;
        this.drop = drop;
        this.cabType = cabType;
    }

    public String getName() {
        return name;
    }

    public String getPickup() {
        return pickup;
    }

    public String getDrop() {
        return drop;
    }

    public String getCabType() {
        return cabType;
    }
}