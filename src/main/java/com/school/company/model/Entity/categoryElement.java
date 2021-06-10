package com.school.company.model.Entity;

import jdk.jfr.Category;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "category_elements")
public class categoryElement implements Serializable {

    private static final long serialVersionUID = 25416549L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "categoryelement_id")
    private int categoryElement_id;

    @Column(name = "categoryelement_name")
    private String categoryElementName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private Category category;

    public categoryElement() {
    }

    public categoryElement(int categoryElement_id, String categoryElementName, Category category) {
        this.categoryElement_id = categoryElement_id;
        this.categoryElementName = categoryElementName;
        this.category = category;
    }

    public categoryElement(String categoryElementName, Category category) {
        this.categoryElementName = categoryElementName;
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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
