package com.chinagpay.boss.dao.zboss;



import com.chinagpay.boss.model.Announce;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AnnounceMapper {

	  List<Announce> selectAnnounce(Announce announce);
		
	  int insertAnnounce(Announce announce);
	  
	  int deleteByPrimaryKey(Announce announce);
	  
	  Announce selectByPrimaryKey(String id);
	  
	  int updateStatusByPrimaryKey(Announce announce);
	  
	  int updateByPrimaryKey(Announce announce);
}