package com.school.company.model.Entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;


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


    public Vacation() {
    }

    public Vacation(int vacationID, String vacationStartDateAndTime, String vacationEndDateAndTime) {
        VacationID = vacationID;
        this.vacationStartDateAndTime = vacationStartDateAndTime;
        VacationEndDateAndTime = vacationEndDateAndTime;
    }

    public Vacation(String vacationStartDateAndTime, String vacationEndDateAndTime) {
        this.vacationStartDateAndTime = vacationStartDateAndTime;
        VacationEndDateAndTime = vacationEndDateAndTime;
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
}
