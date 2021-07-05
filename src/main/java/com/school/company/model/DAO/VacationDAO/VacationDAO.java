package com.school.company.model.DAO.VacationDAO;

import com.school.company.model.Entity.Employee;
import com.school.company.model.Entity.Vacation;

import java.util.List;
import java.util.Map;

public interface VacationDAO {
    Number vacationCount();
    Vacation findVacationById(int vacationId);
    List<Vacation> getVacationList(int min,int max);
    List<Vacation> getEmployeeVacationList(int employeeId);
    void insertVacation(int employeeId,Vacation vacation);
    void updateVacationStatus(int vacationId, int categoryElementId);
    Map<String,String> VacationTimeListOfEmployee(int employeeId);
    void updateVacationDateAndTime(int employeeId,String vacationStartDateAndTime,String vacationEndDateAndTime);
    void deleteVacation(int vacationId);

}
