package com.school.company.model.Entity;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@Table(name = "t_vacation")
public class Vacation extends BaseEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "c_VacationId")
    private int VacationID;

    @Column(name = "c_VacationStartDateAndTime")
    private String vacationStartDateAndTime;

    @Column(name = "c_VacationEndDateAndTime")
    private String VacationEndDateAndTime;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "c_Employee" )
    private Employee Employee;

    @ManyToOne( fetch = FetchType.EAGER)
    @JoinColumn(name = "c_CategoryElement" )
    private categoryElement categoryElement;

    public Vacation() {
    }

    public Vacation(int vacationID, String vacationStartDateAndTime, String vacationEndDateAndTime, Employee employees, categoryElement categoryElement) {
        VacationID = vacationID;
        this.vacationStartDateAndTime = vacationStartDateAndTime;
        VacationEndDateAndTime = vacationEndDateAndTime;
        Employee = employees;
        this.categoryElement = categoryElement;
    }

    public Vacation(String vacationStartDateAndTime, String vacationEndDateAndTime, Employee employees, com.school.company.model.Entity.categoryElement categoryElement) {
        this.vacationStartDateAndTime = vacationStartDateAndTime;
        VacationEndDateAndTime = vacationEndDateAndTime;
        Employee = employees;
        this.categoryElement = categoryElement;
    }

    public int getVacationID() {
        return VacationID;
    }

    public String getVacationStartDateAndTime() {
        return vacationStartDateAndTime;
    }

    public void setVacationStartDateAndTime(String vacationStartDateAndTime) {
        this.vacationStartDateAndTime = vacationStartDateAndTime;
    }

    public String getVacationEndDateAndTime() {
        return VacationEndDateAndTime;
    }

    public void setVacationEndDateAndTime(String vacationEndDateAndTime) {
        VacationEndDateAndTime = vacationEndDateAndTime;
    }

    public Employee getEmployee() {
        return Employee;
    }

    public void setEmployee(Employee employee) {
        Employee = employee;
    }

    public categoryElement getCategoryElement() {
        return categoryElement;
    }

    public void setCategoryElement(categoryElement categoryElement) {
        this.categoryElement = categoryElement;
    }
}
