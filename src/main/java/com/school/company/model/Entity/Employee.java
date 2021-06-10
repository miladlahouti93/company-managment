package com.school.company.model.Entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "employees")
public class Employee implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_id")
    private int id;

    @Column(name = "fistname")
    private String firstName;

    @Column(name = "lastname")
    private String lastName ;

    @Column(name = "email_address")
    private String email;

    @Column(name = "password")
    private String password;

    @Enumerated(EnumType.STRING)
    private role role;

    @Column(name="created_at")
    private String createdAt;

    @Column(name = "updated_at")
    private String updatedAt;

    @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "manager_id")
    private Employee employee;

    @ManyToOne(cascade = CascadeType.ALL , fetch = FetchType.LAZY)
    @JoinColumn(name = "categoryelement_id" )
    private categoryElement categoryElement;

    @ManyToOne(cascade = CascadeType.ALL , fetch = FetchType.LAZY)
    @JoinColumn(name = "email_id" )
    private Email Email;

    @ManyToOne(cascade = CascadeType.ALL , fetch = FetchType.LAZY)
    @JoinColumn(name = "vacation_id" )
    private Vacation vacation;

    @OneToMany(mappedBy = "employees")
    private Set<Employee> employees = new HashSet<Employee>();

    @ManyToMany(targetEntity = Email.class,cascade = CascadeType.ALL)
    @JoinTable(name = "email_employee",joinColumns ={@JoinColumn(name = "employee_id")},
    inverseJoinColumns = {@JoinColumn(name = "email_id")})
    private Set<Email> emails;

    public Employee() {
    }

    public Employee(int id, String firstName, String lastName, String email, String password, com.school.company.model.Entity.role role, String createdAt, String updatedAt, Employee employee, com.school.company.model.Entity.categoryElement categoryElement, com.school.company.model.Entity.Email email1, Vacation vacation) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.employee = employee;
        this.categoryElement = categoryElement;
        Email = email1;
        this.vacation = vacation;
    }

    public Employee(String firstName, String lastName, String email, String password, com.school.company.model.Entity.role role, String createdAt, String updatedAt, Employee employee, com.school.company.model.Entity.categoryElement categoryElement, com.school.company.model.Entity.Email email1, Vacation vacation) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.employee = employee;
        this.categoryElement = categoryElement;
        Email = email1;
        this.vacation = vacation;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public com.school.company.model.Entity.role getRole() {
        return role;
    }

    public void setRole(com.school.company.model.Entity.role role) {
        this.role = role;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public com.school.company.model.Entity.categoryElement getCategoryElement() {
        return categoryElement;
    }

    public void setCategoryElement(com.school.company.model.Entity.categoryElement categoryElement) {
        this.categoryElement = categoryElement;
    }

    public void setEmail(com.school.company.model.Entity.Email email) {
        Email = email;
    }

    public Vacation getVacation() {
        return vacation;
    }

    public void setVacation(Vacation vacation) {
        this.vacation = vacation;
    }

    public Set<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }

    public Set<com.school.company.model.Entity.Email> getEmails() {
        return emails;
    }

    public void setEmails(Set<com.school.company.model.Entity.Email> emails) {
        this.emails = emails;
    }
}
