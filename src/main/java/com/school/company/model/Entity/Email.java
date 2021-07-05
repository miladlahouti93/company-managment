package com.school.company.model.Entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "t_email")
public class Email extends BaseEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "c_EmailId")
    private int id;

    @Column(name = "c_EmailTitle")
    private String title;

    @Column(name = "c_EmailText")
    private String text;

    @Column(name = "c_SendDateAndTime")
    private String sendAt;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "c_Attach")
    private Attach attach;


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
}
