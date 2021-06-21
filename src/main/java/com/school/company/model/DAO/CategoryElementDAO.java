package com.school.company.model.DAO;

import com.school.company.model.Entity.categoryElement;

import java.util.List;

public interface CategoryElementDAO {
    List<categoryElement> getCategoryElements(int categoryId);
    void insertCategoryElement(categoryElement categoryElement);
    void deleteCategoryElement(int categoryElementId);
    categoryElement findCategoryElementById(int categoryElementId);

}
