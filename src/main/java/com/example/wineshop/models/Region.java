package com.example.wineshop.models;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Entity
public class Region {

    private @Id @GeneratedValue(strategy = GenerationType.IDENTITY) Long id;
    private String name;
    private String country;
    @OneToMany(mappedBy = "region" , cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
    private List<Wine> wineList;

    public Region() {}

    public Region(String name, String country, List<Wine> wineList) {
        this.name = name;
        this.country = country;
        this.wineList = wineList;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Region region = (Region) o;
        return Objects.equals(id, region.id) && Objects.equals(name, region.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name);
    }

    @Override
    public String toString() {
        return "Region{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", country='" + country + '\'' +
        '}';
    }
}
