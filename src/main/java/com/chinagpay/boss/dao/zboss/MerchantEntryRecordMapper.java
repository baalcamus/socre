package com.chinagpay.boss.dao.zboss;

import com.chinagpay.boss.model.MerchantEntryRecord;
import org.springframework.stereotype.Repository;

/**
 * Created by hanbinyu on 2016/7/22.
 */
@Repository("merchantEntryRecordMapper")
public interface MerchantEntryRecordMapper {
    void createMerchantEntryRecord(MerchantEntryRecord merchantEntryRecord);
}
