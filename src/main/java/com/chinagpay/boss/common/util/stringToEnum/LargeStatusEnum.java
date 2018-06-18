package com.chinagpay.boss.common.util.stringToEnum;


public class LargeStatusEnum {
	//大额交易 统计数据生成  对应的状态  
		public enum LargeTransDataStatusEnum implements IBaseEnum{
			INIT("INIT"),   //初始化
			GENERATING("GENERATING"),     //正在生成
			NOMATCHDATA("NOMATCHDATA"),     //没有符合条件的数据
			SUCCESS("SUCCESS"),     //已完成生成
			FAIL("FAIL");      //生成数据失败
			
			
			private String value;
			private LargeTransDataStatusEnum(String value){
				this.value = value;
			}
			public String getValue(){
				return this.value;
			}
		}
		interface IBaseEnum{
			public String getValue();
		}
}
