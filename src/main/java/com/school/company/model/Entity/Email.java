package com.school.company.model.Entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "emails")
public class Email implements Serializable {

    private static final long serialVersionUID = 25416548L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "email_id")
    private int id;

    @Column(name = "title")
    private String title;

    @Column(name = "text")
    private String text;

    @Column(name = "send_at")
    private String sendAt;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "attach_id")
    private Attach attach;

    @OneToMany(mappedBy = "email")
    private Set<Employee> employees;

    public Email() {
    }

    public Email(int id, String title, String text, String sendAt, Attach attach) {
        this.id = id;
        this.title = title;
        this.text = text;
        this.sendAt = sendAt;
        this.attach = attach;
    }

    public Email(String title, String text, String sendAt, Attach attach) {
        this.title = title;
        this.text = text;
        this.sendAt = sendAt;
        this.attach = attach;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getSendAt() {
        return sendAt;
    }

    public void setSendAt(String sendAt) {
        this.sendAt = sendAt;
    }

    public Attach getAttach() {
        return attach;
    }

    public void setAttach(Attach attach) {
        this.attach = attach;
    }

    public Set<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }
}
