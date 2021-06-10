package com.school.company.model.Entity;


import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "attach")
public class Attach implements Serializable {

    private static final long serialVersionUID = 25416552L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "attach")
    private String attach;

    @OneToMany(mappedBy = "attach")
    private Set<Email> emails;

    public Attach() {
    }

    public Attach(int id, String attach) {
        this.id = id;
        this.attach = attach;
    }

    public Attach(String attach) {
        this.attach = attach;
    }

    public int getId() {
        return id;
    }

    public String getAttach() {
        return attach;
    }

    public void setId(int id,String attach) {
        this.id = id;
        this.attach = attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public Set<Email> getEmails() {
        return emails;
    }

    public void setEmails(Set<Email> emails) {
        this.emails = emails;
    }

}
