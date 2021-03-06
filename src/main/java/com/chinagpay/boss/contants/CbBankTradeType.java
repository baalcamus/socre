package com.chinagpay.boss.contants;
/** 
	* @author  liws  
	* @date    2017年7月4日 下午5:28:52  
*/
public class CbBankTradeType {

	public enum CebBusinessTradeCode{

		/*******网络购物******/
		SHOPING_NOCUSTOM_TRADE("SHOPING_NOCUSTOM_TRADE","122030","SHOP_ONLINE","网络购物XXX进口货款支出"),
		/*******运输服务******/
		EXPORT_OCEAN_TRANSPORT("EXPORT_OCEAN_TRANSPORT","222011","INTER_TRANSPORT","货物出口海运费支出"),
		IMPORT_OCEAN_TRANSPORT("IMPORT_OCEAN_TRANSPORT","222012","INTER_TRANSPORT","货物进口海运费支出"),
		OTHER_OCEAN_TRANSPORT("OTHER_OCEAN_TRANSPORT","222013","INTER_TRANSPORT","不涉及我国进出口的货物海运费支出"),
		OCEAN_PASSENGER_TRANSPORT("OCEAN_PASSENGER_TRANSPORT","222014","INTER_TRANSPORT","海运客运船票款支出"),
		OTHER_OCEAN_SERVICES("OTHER_OCEAN_SERVICES","222019","INTER_TRANSPORT","海运佣金或代理费支出/ 海运港杂费支出"),
		EXPORT_AIR_TRANSPORT("EXPORT_AIR_TRANSPORT","222021","INTER_TRANSPORT","货物出口空运费支出"),
		IMPORT_AIR_TRANSPORT("IMPORT_AIR_TRANSPORT","222022","INTER_TRANSPORT","货物进口口空运费支出"),
		OTHER_AIR_TRANSPROT("OTHER_AIR_TRANSPROT","222023","INTER_TRANSPORT","不涉及我国进出口的货物空运费支出"),
		AIR_PASSENGER_TRANSPORT("AIR_PASSENGER_TRANSPORT","222024","INTER_TRANSPORT","空运客运机票款支出"),
		OTHER_AIR_SERVICES("OTHER_AIR_SERVICES","222029","INTER_TRANSPORT","空运佣金、代理费支出/ 空运港杂费支出"),
		EXPORT_OTHER_TRANSPORT("EXPORT_OTHER_TRANSPORT","222031","INTER_TRANSPORT","货物出口陆运费支出"),
		IMPORT_OTHER_TRANSPORT("IMPORT_OTHER_TRANSPORT","222032","INTER_TRANSPORT","货物进口陆运费支出"),
		OTHER_OTHER_TRANSPORT("OTHER_OTHER_TRANSPORT","222033","INTER_TRANSPORT","不涉及我国进出口的货物陆运费支出"),
		OTHER_PASSENGER_TRANSPORT("OTHER_PASSENGER_TRANSPORT","222034","INTER_TRANSPORT","客运火车票款支出"),
		/*OTHER_OTHER_SERVICES("OTHER_OTHER_SERVICES","222039","INTER_TRANSPORT","其他运输方式的其他服务"),*/
		POSTAL_DELIVERY_SERVICES("POSTAL_DELIVERY_SERVICES","222040","INTER_TRANSPORT","国际邮政快递服务费支出"),
		/*******公务旅行******/
		BUSINESS_TRAVEL("BUSINESS_TRAVEL","223010","TOURISM_SERVICE","商务旅行会议费支出"),
		/*******私人旅行******/
		MEDICAL_HEALTH_TRAVEL("MEDICAL_HEALTH_TRAVEL","223021","HOTEL_PRIVATE","接受境外医疗及健康服务费支出"),
		EDUCATION_UPONEY_TRAVEL("EDUCATION_UPONEY_TRAVEL","223022","HOTEL_PRIVATE","一年以上境外留学服务费支出"),
		EDUCATION_DOWNONEY_TRAVEL("EDUCATION_DOWNONEY_TRAVEL","223023","HOTEL_PRIVATE","一年以下境外留学服务费支出"),
		OTHER_TRIPS_TRAVEL("OTHER_TRIPS_TRAVEL","223029","HOTEL_PRIVATE","旅行社团费支出/ 因私旅行食宿费支出"),
		/*******软件服务******/
		COMPUTER_SERVICE("COMPUTER_SERVICE","227020","SOFTWARE_SERVICE","计算机软件服务费支出"),
		/*******国际展览******/
		EXHIBITION_SERVICES("EXHIBITION_SERVICES","228025","INTER_EXHIBITION","国际展会服务费支出");
			
		private String des;
		private String code;
		private String businessType;
		private String comment;
		CebBusinessTradeCode(String des,String code,String businessType , String comment) {
			this.des=des;
			this.code = code;
			this.businessType = businessType;
			this.comment = comment;
		}
		public String getCode() {
			return code;
		}
		public String getDes() {
			return des;
		}
		public String getBusinessType() {
			return businessType;
		}
		public String getComment() {
			return comment;
		}
		
	}
	
	
	public enum EciticBusinessTradeCode{
		/*******货物贸易******/
		GENERAL_TRADE("GENERAL_TRADE","121010","GOODS_TRADE","一般贸易"),
		FEED_TRADE("FEED_TRADE","121020","GOODS_TRADE","进料加工贸易"),
		CUSTOM_TRADE("CUSTOM_TRADE","121030","GOODS_TRADE","海关特殊监管区域及保税监管场所进出境物流货物"),
		IMPORT_TRADE("IMPORT_TRADE","121040","GOODS_TRADE","进口非货币黄金进出口"),
/*		GOODS_TRADE_121010("121050","GOODS_TRADE","一般贸易"),
		GOODS_TRADE_121010("121060","GOODS_TRADE","一般贸易"),
		GOODS_TRADE_121010("121070","GOODS_TRADE","一般贸易"),*/
		BORDER_MICRO_TRADE("BORDER_MICRO_TRADE","121080","GOODS_TRADE","边境小额贸易"),
		FOREIGN_ENGINEERING_TRADE("FOREIGN_ENGINEERING_TRADE","121090","GOODS_TRADE","对外承包工程货物出口"),
		FOREIGN_INVESTMENT_TRADE("FOREIGN_INVESTMENT_TRADE","121100","GOODS_TRADE","外商投资企业作为投资进口设备、物品的支出"),
		IMPORT_EQUIPMENT_TRADE("IMPORT_EQUIPMENT_TRADE","121110","GOODS_TRADE","加工贸易进口设备"),
		OTHER_GOOD_TRADE("OTHER_GOOD_TRADE","121990","GOODS_TRADE","其他纳入海关统计的货物贸易"),
		OFFSHORE_RESALE_TRADE("OFFSHORE_RESALE_TRADE","122010","GOODS_TRADE","离岸转手买卖"),
		GOLD_NOCUSTOM_TRADE("GOLD_NOCUSTOM_TRADE","122020","GOODS_TRADE","未纳入海关统计的非货币黄金"),
		SHOPING_NOCUSTOM_TRADE("SHOPING_NOCUSTOM_TRADE","122030","GOODS_TRADE","未纳入海关统计的网络购物"),
		OTHER_NOCUSTOM_TRADE("OTHER_NOCUSTOM_TRADE","121990","GOODS_TRADE","其他未纳入海关统计的货物贸易"),
		/*******旅游服务******/
		BUSINESS_TRAVEL("BUSINESS_TRAVEL","223010","TOURISM_SERVICE","公务及商务旅行"),
		/******酒店住宿******/
		MEDICAL_HEALTH_TRAVEL("MEDICAL_HEALTH_TRAVEL","223021","HOTEL","就医及健康相关旅行"),
		EDUCATION_UPONEY_TRAVEL("EDUCATION_UPONEY_TRAVEL","223022","HOTEL","留学及教育相关旅行（一年以上）"),
		EDUCATION_DOWNONEY_TRAVEL("EDUCATION_DOWNONEY_TRAVEL","223023","HOTEL","留学及教育相关旅行（一年及一年以下）"),
		OTHER_TRIPS_TRAVEL("OTHER_TRIPS_TRAVEL","223029","HOTEL","其他私人旅行"),
		/*******机票预订******/
		AIR_TICKETS_PASSENGER("AIR_TICKETS_PASSENGER","222024","AIR_TICKETS","空运客运"),
		/*******留学服务******/
		UPONEY_EDUCATION("UPONEY_EDUCATION","223022","ABROAD_EDU","留学及教育相关旅行（一年以上）"),
		DOWNONEY_EDUCATION("DOWNONEY_EDUCATION","223023","ABROAD_EDU","留学及教育相关旅行（一年及一年以下）"),
		/*******国际展览******/
		EXHIBITION_SERVICES("EXHIBITION_SERVICES","228025","INTER_EXHIBITION","展会服务"),
		/*******通信服务******/
		TELECOMMUNICATION_SERVICE("TELECOMMUNICATION_SERVICE","227010","COMMUNICATION_SERVICES","电信服务"),
		/*******软件服务******/
		COMPUTER_SERVICE("COMPUTER_SERVICE","227020","SOFTWARE_SERVICE","计算机服务"),
		INFORMATION_SERVICE("INFORMATION_SERVICE","227030","SOFTWARE_SERVICE","信息服务"),
		/*******国际运输******/
		EXPORT_OCEAN_TRANSPORT("EXPORT_OCEAN_TRANSPORT","222011","INTER_TRANSPORT","涉及我国出口的海洋货运服务"),
		IMPORT_OCEAN_TRANSPORT("IMPORT_OCEAN_TRANSPORT","222012","INTER_TRANSPORT","涉及我国进口的海洋货运服务"),
		OTHER_OCEAN_TRANSPORT("OTHER_OCEAN_TRANSPORT","222013","INTER_TRANSPORT","不涉及我国进出口的海洋货运服务"),
		OCEAN_PASSENGER_TRANSPORT("OCEAN_PASSENGER_TRANSPORT","222014","INTER_TRANSPORT","海运客运"),
		OTHER_OCEAN_SERVICES("OTHER_OCEAN_SERVICES","222019","INTER_TRANSPORT","其他海运服务"),
		EXPORT_AIR_TRANSPORT("EXPORT_AIR_TRANSPORT","222021","INTER_TRANSPORT","涉及我国出口的空中货运服务"),
		IMPORT_AIR_TRANSPORT("IMPORT_AIR_TRANSPORT","222022","INTER_TRANSPORT","涉及我国进口的空中货运服务"),
		OTHER_AIR_TRANSPROT("OTHER_AIR_TRANSPROT","222023","INTER_TRANSPORT","不涉及我国进出口的空中货运服务"),
		AIR_PASSENGER_TRANSPORT("AIR_PASSENGER_TRANSPORT","222024","INTER_TRANSPORT","空运客运"),
		OTHER_AIR_SERVICES("OTHER_AIR_SERVICES","222029","INTER_TRANSPORT","其他空运服务"),
		EXPORT_OTHER_TRANSPORT("EXPORT_OTHER_TRANSPORT","222031","INTER_TRANSPORT","涉及我国出口的其他运输方式货运服务"),
		IMPORT_OTHER_TRANSPORT("IMPORT_OTHER_TRANSPORT","222032","INTER_TRANSPORT","涉及我国进口的其他运输方式货运服务"),
		OTHER_OTHER_TRANSPORT("OTHER_OTHER_TRANSPORT","222033","INTER_TRANSPORT","不涉及我国进出口的其他运输方式货运服务"),
		OTHER_PASSENGER_TRANSPORT("OTHER_PASSENGER_TRANSPORT","222034","INTER_TRANSPORT","其他运输方式客运"),
		OTHER_OTHER_SERVICES("OTHER_OTHER_SERVICES","222039","INTER_TRANSPORT","其他运输方式的其他服务"),
		POSTAL_DELIVERY_SERVICES("POSTAL_DELIVERY_SERVICES","222040","INTER_TRANSPORT","邮政及寄递服务");
		
		private String des;
		private String code;
		private String businessType;
		private String comment;
		EciticBusinessTradeCode(String des,String code,String businessType , String comment) {
			this.des=des;
			this.code = code;
			this.businessType = businessType;
			this.comment = comment;
		}
		public String getCode() {
			return code;
		}
		public String getDes() {
			return des;
		}
		public String getBusinessType() {
			return businessType;
		}
		public String getComment() {
			return comment;
		}
		
	}
}
