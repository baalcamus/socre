package com.chinagpay.boss.dao.zboss;

import com.chinagpay.boss.model.BusinessReport;
import org.springframework.stereotype.Repository;

/**
 * Created by hanbinyu on 2016/7/28.
 */
@Repository("businessReportMapper")
public interface BusinessReportMapper {
    BusinessReport selectYearReportOfBusiness(BusinessReport businessReport);
}
