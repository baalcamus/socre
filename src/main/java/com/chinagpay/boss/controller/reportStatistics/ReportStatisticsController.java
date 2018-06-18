package com.chinagpay.boss.controller.reportStatistics;

import com.chinagpay.boss.common.exception.CommonsException;
import com.chinagpay.boss.model.BusinessReport;
import com.chinagpay.boss.service.ReportStatisticsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Created by hanbinyu on 2016/7/28.
 */
@Controller
public class ReportStatisticsController {
    @Resource(name = "reportStatisticsService")
    private ReportStatisticsService reportStatisticsService;

    @RequestMapping("/reportStatistics/selectYearReportOfBusinessList")
    public String selectYearReportOfBusinessList(HttpServletRequest request,String beginDate,String endDate){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        BusinessReport businessReport = new BusinessReport();
        try {
            businessReport.setBeginDate(beginDate == null||("").equals(beginDate)? null : sdf.parse(beginDate));
            businessReport.setEndDate(endDate == null||("").equals(endDate) ? null : sdf.parse(endDate));
        } catch (ParseException e) {
            e.printStackTrace();
            throw new CommonsException("日期转换异常");
        }

        businessReport = reportStatisticsService.selectYearReportOfBusiness(businessReport);

        request.setAttribute("businessReport",businessReport);
        return "reportStatistics/yearReportOfBusiness";
    }

}
