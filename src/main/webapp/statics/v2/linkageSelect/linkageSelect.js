function linkageSelect(ctx,provinceParam,cityParam,areaParam,provinceId,cityId,areaId){
	var province =  $("#"+provinceParam);
	var city = $("#"+cityParam);
	//var area = $("#"+areaParam);
	$.get(ctx+"/linkageSelect/getProvince.do",function(data){
		if(data.status){
            var result = "<option value=''>选择省份</option>";
            var name;
            $.each(data.obj,function(n,value){
            	if(provinceId == value.key){
            		name = value.value;
            		result +="<option value='"+value.key+"' selected='selected' >"+value.value+"</option>";
            	}else{
                    result +="<option value='"+value.key+"'>"+value.value+"</option>";
            	}
            });
            province.html('');
            province.append(result);
            $("#s2id_"+provinceParam).find(".select2-choice").find(".select2-chosen").text(name);
            
            $.get(ctx+"/linkageSelect/getCity/"+provinceId+".do",function(data){
                if(data.status){
                    var result = "<option value=''>选择城市</option>";
                    var name;
                    $.each(data.obj,function(n,value){
                    	if(cityId == value.key){
                    		name = value.value;
                    		result +="<option value='"+value.key+"' selected='selected' >"+value.value+"</option>";
                    	}else{
                            result +="<option value='"+value.key+"'>"+value.value+"</option>";
                    	}
                    });
                    city.html('');
                    city.append(result);
                    $("#s2id_"+cityParam).find(".select2-choice").find(".select2-chosen").text(name);
                    
                    /*$.get(ctx+"/linkageSelect/getArea/"+cityId,function(data){
    	                if(data.status){
    	                    var result = "<option value=''>选择区域</option>";
    	                    var name2;
    	                    $.each(data.obj,function(n,value){
    	                    	if(areaId==value.id){
    	                    		name2 = value.name;
    	                    		result +="<option value='"+value.id+"' selected='selected' >"+value.name+"</option>";
    	                    	}else{
    	                    		result +="<option value='"+value.id+"'>"+value.name+"</option>";
    	                    	}
    	                        
    	                    });
    	                    area.html('');
    	                    area.append(result);
    	                    $("#s2id_"+areaParam).find(".select2-choice").find(".select2-chosen").text(name2);
    	                }
    	            },"json");*/
                }
            },"json");
		}
	},"json");
	
	province.change(function () {
    	if(province.val() == null || province.val()== ""){
    		 $("#s2id_"+cityParam).find(".select2-choice").find(".select2-chosen").text("选择城市");
    		 //$("#s2id_"+areaParam).find(".select2-choice").find(".select2-chosen").text("选择区域");
    		 city.empty();
    		 city.html("");
			 //area.empty();
			 city.append("<option value='' selected='selected'>选择城市</option>");
    		 //area.append("<option value='' selected='selected'>选择区域</option>");
    	}else{
    		$.get(ctx+"/linkageSelect/getCity/"+province.val()+".do",function(data){
    			 //area.empty();
    			// area.append("<option value='' selected='selected'>选择区域</option>");
    			 $("#s2id_"+cityParam).find(".select2-choice").find(".select2-chosen").text("选择城市");
    			// $("#s2id_"+areaParam).find(".select2-choice").find(".select2-chosen").text("选择区域");
                if(data.status){
                    var result = "<option value=''>选择城市</option>";
                    $.each(data.obj,function(n,value){
                        result +="<option value='"+value.key+"'>"+value.value+"</option>";
                    });
                    city.html('');
                    city.append(result);
                }
            },"json");
    	}
    });
    
/*	city.change(function () {
    		if(city.val() == null || city.val() == ""){
    			$("#s2id_"+areaParam).find(".select2-choice").find(".select2-chosen").text("选择区域");
	        	area.empty();
	        	area.append("<option value='' selected='selected'>选择区域</option>");
	        }else{
	        	$.get(ctx+"/sys/linkageSelect/getArea/"+city.val(),function(data){
	        		$("#s2id_"+areaParam).find(".select2-choice").find(".select2-chosen").text("选择区域");
	                if(data.status){
	                    var result = "<option value=''>选择区域</option>";
	                    $.each(data.obj,function(n,value){
	                        result +="<option value='"+value.id+"'>"+value.name+"</option>";
	                    });
	                    area.html('');
	                    area.append(result);
	                }
	            },"json");
	        }
            
        });*/

}