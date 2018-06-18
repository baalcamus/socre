package com.chinagpay.boss.dao.zboss;

import com.chinagpay.boss.model.BankData;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hanbinyu on 2016/7/26.
 */
@Repository("bankDataMapper")
public interface BankDataMapper {
    List<BankData> selectAllBankData();
}
