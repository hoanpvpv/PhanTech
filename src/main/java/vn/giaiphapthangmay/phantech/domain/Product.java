package vn.giaiphapthangmay.phantech.domain;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private double speed;
    private double loadCapacity;
    private String doorType;
    @Column(columnDefinition = "MEDIUMTEXT")
    private String video;
    private String controlTechnology;
    private String pitOrMachineRoom;
    private String powerSupply;
    private double warranty;
    private String shortDescription;
    private long reviewCount;

    public void setId(long id) {
        this.id = id;
    }

    public long getReviewCount() {
        return reviewCount;
    }

    public void setReviewCount(long reviewCount) {
        this.reviewCount = reviewCount;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    @Column(columnDefinition = "MEDIUMTEXT")
    private String description;
    private double cabinSize;
    private String documentation;
    private String image1;
    private String image2;
    private String image3;
    private String image4;
    private String image5;
    private double rating;
    private long price;

    public double getRating() {
        return rating;
    }

    public void setRating(double rate) {
        this.rating = rate;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    @OneToMany(mappedBy = "product")
    private List<Review> reviews;
    @OneToMany(mappedBy = "product")
    private List<Project> projects;
    @ManyToOne
    @JoinColumn(name = "elevator_type_id")
    private ElevatorType elevatorType;
    @ManyToOne
    @JoinColumn(name = "manufacturer_id")
    private Manufacturer manufacturer;

    public String getName() {
        return name;
    }

    public long getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getSpeed() {
        return speed;
    }

    public void setSpeed(double speed) {
        this.speed = speed;
    }

    public double getLoadCapacity() {
        return loadCapacity;
    }

    public void setLoadCapacity(double loadCapacity) {
        this.loadCapacity = loadCapacity;
    }

    public String getDoorType() {
        return doorType;
    }

    public void setDoorType(String doorType) {
        this.doorType = doorType;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getControlTechnology() {
        return controlTechnology;
    }

    public void setControlTechnology(String controlTechnology) {
        this.controlTechnology = controlTechnology;
    }

    public String getPitOrMachineRoom() {
        return pitOrMachineRoom;
    }

    public void setPitOrMachineRoom(String pitOrMachineRoom) {
        this.pitOrMachineRoom = pitOrMachineRoom;
    }

    public String getPowerSupply() {
        return powerSupply;
    }

    public void setPowerSupply(String powerSupply) {
        this.powerSupply = powerSupply;
    }

    public double getWarranty() {
        return warranty;
    }

    public void setWarranty(double warranty) {
        this.warranty = warranty;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getCabinSize() {
        return cabinSize;
    }

    public void setCabinSize(double cabinSize) {
        this.cabinSize = cabinSize;
    }

    public String getDocumentation() {
        return documentation;
    }

    public void setDocumentation(String documentation) {
        this.documentation = documentation;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public String getImage5() {
        return image5;
    }

    public void setImage5(String image5) {
        this.image5 = image5;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public List<Project> getProjects() {
        return projects;
    }

    public void setProjects(List<Project> projects) {
        this.projects = projects;
    }

    public ElevatorType getElevatorType() {
        return elevatorType;
    }

    public void setElevatorType(ElevatorType elevatorType) {
        this.elevatorType = elevatorType;
    }

    public Manufacturer getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(Manufacturer manufacturer) {
        this.manufacturer = manufacturer;
    }

}
