package com.school.company.model.Entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "t_employee")
public class Employee extends BaseEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "c_EmployeeId")
    private int employeeID;

    @Column(name = "c_FirstName")
    private String firstName;

    @Column(name = "c_LastName")
    private String lastName ;

    @Column(name = "c_EmailAddress")
    private String emailAddress;

    @Column(name = "c_Password")
    private String password;


    @Column(name="c_createDateAndTime")
    private String createDateAndTime;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "c_Employee")
    private Employee employee;

    @ManyToOne( fetch = FetchType.EAGER)
    @JoinColumn(name = "c_CategoryElement" )
    private categoryElement categoryElement;

    @ManyToOne( fetch = FetchType.EAGER)
    @JoinColumn(name = "c_Email" )
    private Email Email;

    @ManyToOne( fetch = FetchType.EAGER)
    @JoinColumn(name = "c_Vacation" )
    private Vacation vacation;


    @OneToMany(mappedBy = "employees")
    private transient Set<Employee> employees = new HashSet<Employee>();

    @ManyToMany(targetEntity = Email.class,cascade = CascadeType.ALL)
    @JoinTable(name = "t_emailemployee",joinColumns ={@JoinColumn(name = "c_Employee")},
    inverseJoinColumns = {@JoinColumn(name = "c_Email")})
    private Set<Email> emails;

    public Employee() {
    }

    public Employee(int employeeID, String firstName, String lastName, String emailAddress, String password, String createDateAndTime, Employee employee, com.school.company.model.Entity.categoryElement categoryElement, com.school.company.model.Entity.Email email, Vacation vacation) {
        this.employeeID = employeeID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailAddress = emailAddress;
        this.password = password;
        this.createDateAndTime = createDateAndTime;
        this.employee = employee;
        this.categoryElement = categoryElement;
        Email = email;
        this.vacation = vacation;
    }

    public Employee(String firstName, String lastName, String emailAddress, String password, String createDateAndTime, Employee employee, com.school.company.model.Entity.categoryElement categoryElement, com.school.company.model.Entity.Email email, Vacation vacation) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailAddress = emailAddress;
        this.password = password;
        this.createDateAndTime = createDateAndTime;
        this.employee = employee;
        this.categoryElement = categoryElement;
        Email = email;
        this.vacation = vacation;
    }

    public int getEmployeeID() {
        return employeeID;
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

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCreateDateAndTime() {
        return createDateAndTime;
    }

    public void setCreateDateAndTime(String createDateAndTime) {
        this.createDateAndTime = createDateAndTime;
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

    public com.school.company.model.Entity.Email getEmail() {
        return Email;
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
}
