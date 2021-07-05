package com.school.company.model.Entity;

import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Version;

@MappedSuperclass
public class BaseEntity {

    @Version
    @Column(name = "c_Version")
    protected Long version;


    @Column(name = "c_UpdateDateAndTime")
    protected String updateDateAndTime;

    @Column(name = "c_Active")
    protected boolean active;

    @Column(name = "c_DeleteDateAndTime")
    protected String deleteDateAndTime;

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }

    public String getUpdateDateAndTime() {
        return updateDateAndTime;
    }

    public void setUpdateDateAndTime(String updateDateAndTime) {
        this.updateDateAndTime = updateDateAndTime;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getDeleteDateAndTime() {
        return deleteDateAndTime;
    }

    public void setDeleteDateAndTime(String deleteDateAndTime) {
        this.deleteDateAndTime = deleteDateAndTime;
    }
}
