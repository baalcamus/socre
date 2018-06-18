package com.chinagpay.boss.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chinagpay.boss.dao.zboss.BusinessReportMapper;
import com.chinagpay.boss.model.BusinessReport;
import com.chinagpay.boss.service.ReportStatisticsService;

/**
 * Created by hanbinyu on 2016/7/28.
 */
@Service("reportStatisticsService")
public class ReportStatisticsServiceImpl implements ReportStatisticsService {
    @Resource(name = "businessReportMapper")
    private BusinessReportMapper businessReportMapper;

    @Override
    public BusinessReport selectYearReportOfBusiness(BusinessReport businessReport) {
        businessReport = businessReportMapper.selectYearReportOfBusiness(businessReport);

        return businessReport;
    }
}
