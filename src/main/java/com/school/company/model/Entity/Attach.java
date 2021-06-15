package com.school.company.model.Entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "t_attach")
public class Attach implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "c_AttachId")
    private int attachId;

    @Column(name = "c_Path")
    private String path;

    @OneToMany(mappedBy = "attach")
    private transient Set<Email> emails;

    public Attach() {
    }

    public Attach(int attachId, String path) {
        this.attachId = attachId;
        this.path = path;
    }

    public Attach(String path) {
        this.path = path;
    }

    public int getAttachId() {
        return attachId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
