package com.school.company.model.Entity;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name = "vacations")
public class Vacation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column()
    private int id;

    @Column(name = "fromDate")
    private String fromDate;

    @Column(name = "toDate")
    private String toDate;

    @Column(name = "created_at")
    private String CreatedAt;


    @OneToMany(mappedBy = "vacation")
    private Set<Employee> employees;


    public Vacation() {
    }

    public Vacation(int id, String fromDate, String toDate, String createdAt) {
        this.id = id;
        this.fromDate = fromDate;
        this.toDate = toDate;
        CreatedAt = createdAt;
    }

    public Vacation(String fromDate, String toDate, String createdAt) {
        this.fromDate = fromDate;
        this.toDate = toDate;
        CreatedAt = createdAt;
    }

    public int getId() {
        return id;
    }


    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    public String getCreatedAt() {
        return CreatedAt;
    }

    public void setCreatedAt(String createdAt) {
        CreatedAt = createdAt;
    }

    public Set<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }
}
