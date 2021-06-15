package com.school.company.model.Entity;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "t_categoryelement")
public class categoryElement extends BaseEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "c_CategoryElementId")
    private int categoryElement_id;

    @Column(name = "c_CategoryElementName")
    private String categoryElementName;

    @Column(name = "c_CategoryElementPersianName")
    private String categoryElementPersianName;

    @Column(name = "c_CategoryElementCode")
    private int categoryElementCode;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "c_Category")
    private category category;

    public categoryElement() {
    }

    public categoryElement(int categoryElement_id, String categoryElementName, String categoryElementPersianName, int categoryElementCode, com.school.company.model.Entity.category category) {
        this.categoryElement_id = categoryElement_id;
        this.categoryElementName = categoryElementName;
        this.categoryElementPersianName = categoryElementPersianName;
        this.categoryElementCode = categoryElementCode;
        this.category = category;
    }

    public categoryElement(String categoryElementName, String categoryElementPersianName, int categoryElementCode, com.school.company.model.Entity.category category) {
        this.categoryElementName = categoryElementName;
        this.categoryElementPersianName = categoryElementPersianName;
        this.categoryElementCode = categoryElementCode;
        this.category = category;
    }

    public int getCategoryElement_id() {
        return categoryElement_id;
    }

    public String getCategoryElementName() {
        return categoryElementName;
    }

    public void setCategoryElementName(String categoryElementName) {
        this.categoryElementName = categoryElementName;
    }

    public String getCategoryElementPersianName() {
        return categoryElementPersianName;
    }

    public void setCategoryElementPersianName(String categoryElementPersianName) {
        this.categoryElementPersianName = categoryElementPersianName;
    }

    public int getCategoryElementCode() {
        return categoryElementCode;
    }

    public void setCategoryElementCode(int categoryElementCode) {
        this.categoryElementCode = categoryElementCode;
    }

    public com.school.company.model.Entity.category getCategory() {
        return category;
    }

    public void setCategory(com.school.company.model.Entity.category category) {
        this.category = category;
    }
}
