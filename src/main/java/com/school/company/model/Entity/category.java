package com.school.company.model.Entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "category")
public class category implements Serializable {

    private static final long serialVersionUID = 25416545L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
    private int category_id;

    @Column(name = "categoryname")
    private String categoryName;

    @OneToMany(mappedBy = "category")
    private Set<categoryElement> categoryElements;

    public category() {
    }

    public category(int category_id, String categoryName) {
        this.category_id = category_id;
        this.categoryName = categoryName;
    }

    public category(String categoryname) {
        this.categoryName = categoryname;
    }

    public int getCategory_id() {
        return category_id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Set<categoryElement> getCategoryElements() {
        return categoryElements;
    }

    public void setCategoryElements(Set<categoryElement> categoryElements) {
        this.categoryElements = categoryElements;
    }
}
