package com.school.company.model.Service;

import com.school.company.model.DAO.CategoryElementDAO;
import com.school.company.model.DAO.CtegoryElementDAOImplement;
import com.school.company.model.Entity.categoryElement;

import java.util.List;

public class CategoryElementService {

    private CategoryElementDAO categoryElementDAO = new CtegoryElementDAOImplement();

    public List<categoryElement> getCategoryElements(int id){
        return categoryElementDAO.getCategoryElements(id);
    }

    public categoryElement findCategoryElementById(int categoryElemntId){
        return categoryElementDAO.findCategoryElementById(categoryElemntId);
    }
}
