package com.school.company.model.Service;

import com.school.company.model.DAO.VacationDAO.VacationDAO;
import com.school.company.model.DAO.VacationDAO.VacationDAOImplement;
import com.school.company.model.Entity.Vacation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VacationService {

    private VacationDAO vacationDAO = new VacationDAOImplement();

    public Number vacationCount(){
        return vacationDAO.vacationCount();
    }

    public void insertVacation(int employeeId , Vacation vacation){
        vacationDAO.insertVacation(employeeId,vacation);
    }

    public Map<String, String> vacationTimeListOfEmployee(int employeeId){
       return vacationDAO.VacationTimeListOfEmployee(employeeId);
    }

    public List<Vacation> getVacationList(int startRecord , int endRecord){
        return vacationDAO.getVacationList(startRecord,endRecord);
    }

    public List<Vacation> getEmployeeVacationList(int employeeId){
        return vacationDAO.getEmployeeVacationList(employeeId);
    }

    public void updateVacationStatus(int vacationId , int categoryElementId){
        vacationDAO.updateVacationStatus(vacationId,categoryElementId);
    }

    public void updateVacationDateAndTime(int employeeId,String vacationStartDateAndTime,String vacationEndDateAndTime){
        vacationDAO.updateVacationDateAndTime(employeeId,vacationStartDateAndTime,vacationEndDateAndTime);
    }

    public void daleteVacation(int vacationId){
        vacationDAO.deleteVacation(vacationId);
    }

    public Vacation findVacationById(int vacationId){
       return vacationDAO.findVacationById(vacationId);
    }

    public boolean checkVacationRequestDate(String employeeId , String vacationStartDate , String vacationEndDate) throws ParseException {

        boolean flag = true;
        SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Map<String, String> vacationList = vacationTimeListOfEmployee(Integer.parseInt(employeeId));
        Date requestStartTime = DATE_FORMAT.parse(vacationStartDate.replace('/', '-'));
        Date requestEndTime = DATE_FORMAT.parse(vacationEndDate.replace('/', '-'));

        for (Map.Entry vacationTime : vacationList.entrySet()) {
            Date startTime = DATE_FORMAT.parse(vacationTime.getKey().toString());
            Date endTime = DATE_FORMAT.parse(vacationTime.getValue().toString());
            if ((requestStartTime.after(startTime) && requestStartTime.before(endTime)) || (requestEndTime.after(startTime) && requestEndTime.before(endTime))) {
                flag = false;
            }

        }
        return flag;
    }

    public Map<Integer,Integer> paginationRecordLimit(int currentPage,int recordCount){

        int startLimitRecord,endLimitRecord;
        if(currentPage==1){
            startLimitRecord=0;
            endLimitRecord=10;
        }
        else {
            startLimitRecord=(currentPage-1)*recordCount;
            endLimitRecord=startLimitRecord+recordCount;
        }
        Map<Integer,Integer> limitRecord = new HashMap<>();
        limitRecord.put(startLimitRecord,endLimitRecord);
        return limitRecord;
    }

    public int pageNumbers(int recordCount){
        //Long countRow = vacationCount();
        int totalSize =((Long)vacationCount()).intValue();
        int pageNumber;
        float x =(float)totalSize/recordCount;
        if(x % 1 !=0){
            pageNumber=(int) x +1;
        }
        else {
            pageNumber=(int)x;
        }
        return pageNumber;
    }

}
