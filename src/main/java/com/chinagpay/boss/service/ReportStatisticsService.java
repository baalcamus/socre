package com.chinagpay.boss.service;

import com.chinagpay.boss.model.BusinessReport;


/**
 * Created by hanbinyu on 2016/7/28.
 */
public interface ReportStatisticsService {
    BusinessReport selectYearReportOfBusiness(BusinessReport businessReport);
}
