function refresh_data(){
	var timesteamp=Date.parse(new Date());
	$.ajax({
		url:'findAllComevent',
		type:'get',
		data:{time:timesteamp},
		success:list_comevent
    
	});
	map.clearOverlays();
}
var comevent_data;
function list_comevent(text){
	
	$('#remain_count').html(text+"件");
	$('#list_event').html(null);
	var remain_cate=0;
	$.ajax({
		url:'../data/event.json',
		type:'get',
		success:function(data){
		comevent_data=data;
			for(var i=0;i<text;i++){
				add_event_to_map(i,0);
				var content=(data[i].content!=null&&data[i].content.length>0)?data[i].content:"该用户没有填写内容";
				if(content.length>15){
					content=content.slice(0,15)+'...';
				}//长度大于15设置显示风格
				if(data[i].boolean_cate==1){
					$('#list_event').append('<a class="list-group-item"><span class="label label-default" href="" onclick="add_event_to_map(\''+i+'\',1)">'+content+
							'</span><span class="label label-info" style="float:right" >分类</span><span class="label label-danger" style="float:right;margin:0 0.2em 0 0">☆</span> </a>');
				}else{
					$('#list_event').append('<a class="list-group-item"><span class="label label-default" href="" onclick="add_event_to_map(\''+i+'\',1)">'+content+
							'</span><span class="label label-info" style="float:right" href="" onclick="show_classy('+i+')">分类</span></a>');
					remain_cate++;
				}
			}
			$('#remain_cate').html(remain_cate+"件");	
		//	alert("success_comevent_data:"+comevent_data);

		}
	});
	

}

function show_classy(i){
	//data=eval(data);
	$('#list_content').html(null);
	$('#list_content').html(comevent_data[i].content);
	$('#myClassy').modal();
	
}//打开模态框

function getChange(){
	//alert('test');
	var select=$('#first_classy').val();
	switch (select){
	case '1':
		$('#second_classy').empty();
		$("#second_classy").append($("<option>").val("水、电、气、热").text("水、电、气、热")); 
		$("#second_classy").append($("<option>").val("下水道问题").text("下水道问题")); 
		$("#second_classy").append($("<option>").val("井盖问题").text("井盖问题")); 
		$("#second_classy").append($("<option>").val("设备损坏").text("设备损坏")); 
		$("#second_classy").append($("<option>").val("其他").text("其他")); 
		$("#second_classy").selectpicker('refresh'); 
		break;
	case '2':
		$('#second_classy').empty();
		$("#second_classy").append($("<option>").val("停车设施").text("停车设施")); 
		$("#second_classy").append($("<option>").val("交通标志设施").text("交通标志设施")); 
		$("#second_classy").append($("<option>").val("公交站亭").text("公交站亭")); 
		$("#second_classy").append($("<option>").val("其他").text("其他")); 
		$("#second_classy").selectpicker('refresh');
		break;
	case '3':
		$('#second_classy').empty();
		$("#second_classy").append($("<option>").val("公共厕所").text("公共厕所")); 
		$("#second_classy").append($("<option>").val("垃圾箱").text("垃圾箱")); 
		$("#second_classy").append($("<option>").val("广告牌匾").text("广告牌匾")); 
		$("#second_classy").append($("<option>").val("其他").text("其他")); 
		$("#second_classy").selectpicker('refresh');
		break;
	case '4':
		$('#second_classy').empty();
		$("#second_classy").append($("<option>").val("树木绿地").text("树木绿地")); 
		$("#second_classy").append($("<option>").val("城市雕塑").text("城市雕塑")); 
		$("#second_classy").append($("<option>").val("街头坐标").text("街头坐标")); 
		$("#second_classy").append($("<option>").val("其他").text("其他")); 
		$('#second_classy').selectpicker('refresh');
		break;
	case '5':
		$('#second_classy').empty();
		$("#second_classy").append($("<option>").val("宣传栏").text("宣传栏")); 
		$("#second_classy").append($("<option>").val("人防工事").text("人防工事")); 
		$("#second_classy").append($("<option>").val("地下室").text("地下室")); 
		$("#second_classy").append($("<option>").val("其他").text("其他")); 
		$('#second_classy').selectpicker('refresh');
		break;
	case '6':
		$('#second_classy').empty();
		$("#second_classy").append($("<option>").val("重大危险源").text("重大危险源")); 
		$("#second_classy").append($("<option>").val("工地").text("工地")); 
		$("#second_classy").append($("<option>").val("水域附属设施").text("水域附属设施")); 
		$("#second_classy").append($("<option>").val("其他").text("其他")); 
		$('#second_classy').selectpicker('refresh');
		break;
	}
	
}

function submit_cate(){
	var first_classy=$('#first_classy').val();
	var cate=null;
	switch (first_classy){
	case '1':
		cate='公用设施类';
		break;
	case '2':
		cate='道路交通类';
		break;
	case '3':
		cate='市容环境类';
		break;
	case '4':
		cate='园林绿化类';
		break;
	case '5':
		cate='房屋土地类';
		break;
	case '6':
		cate='扩展部件类 ';
		break;
	}
	var sub_cate=$('#second_classy').val();
	var content=$('#list_content').html();
	$.ajax({
		url:'updateComevent',
		type:'post',
		data:{
			content:content,
			cate:cate,
			sub_cate:sub_cate
		},
		success:function(data){
			$('#myClassy').modal('hide');//关闭模态框
			refresh_data();//刷新数据
		}
	});
}

function add_event_to_map(i,flag){
	if(flag==1){
		map.clearOverlays();
	}
	//点击刷新按钮后会将所有的点都显示在地图上。
	var location=comevent_data[i].location;
	if(location==null||location.length<1){
		if(flag==1)
			alert('此为匿名事件，无经纬度信息');
		return;
	}
	var index=location.indexOf(',');
	var lat=location.slice(0,index);
	var log=location.slice(index+1);
	
	var sContent ="<div><p style='margin:0;line-height:1.5;font-size:13px;'>事件："+comevent_data[i].content+"</p></div>" + 
	"<img style='float:right;margin:4px;border:1px solid #ccc' id='imgDemo' src='../"+comevent_data[i].photo_addr+"' width='100' height='80' alt='该事件无图片'/>"; 
	
	
	var point = new BMap.Point(lat,log);
	
	marker= new BMap.Marker(point);
	marker.show();
	map.centerAndZoom(point, 16);
	var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
	map.addOverlay(marker);
//	var i=0;
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画

	marker.addEventListener("click", function(){          
		/*	i++;
			if(i==1){//第一次点击只画圆和找寻工作人员，以后才会显示信息窗。
	   		show_circle(x,y);//以坐标点为中心画圆
	   		find_worker(x,y);
				}else{
					this.openInfoWindow(infoWindow);
				}*/
		this.openInfoWindow(infoWindow);
		});
	
}


var worker_comdata_event;//在人员调度中的事件数据
var worker_comdata_free;//在人员调度中的空闲人员数据
function dispatcher_refresh_data(){
	var timesteamp=Date.parse(new Date());
	$.ajax({
		url:'findAllComevent',
		type:'get',
		data:{time:timesteamp},
		success:function(data){
			//alert(data);
			
		}
    
	});
	
	$.ajax({
		url:'findFreeWorker',
		type:'get',
		data:{time:timesteamp},
		success:function(data){
			$('#free_worker').html(data+"名");
			dispatcher_refresh();
			
	}
	});
	$.ajax({
		url:'../data/worker_free.json',
		type:'get',
		data:{time:timesteamp},
		success:function(data){
			worker_comdata_free=data;
		//	alert(worker_comdata_free);
	}
	});
	
	
}



function dispatcher_refresh(){
	$('#list_worker').html(null);
	$.ajax({
		url:'../data/event.json',
		type:'get',
		success:function(data){
		worker_comdata_event=data;
			var i=0;
		for(var item in data){
			var content=(data[item].content!=null&&data[item].content.length>0)?data[item].content:"该用户没有填写内容";
			if(content.length>15){
				content=content.slice(0,15)+'...';
			}//长度大于15设置显示风格
			if(item.boolean_cate==1){
				$('#list_worker').append('<a class="list-group-item"><span class="label label-default" href="" onclick="add_event_to_map(\''+i+'\',1)">'+content+
						'</span><span class="label label-info" style="float:right" onclick="show_worker_around_event('+i+')">指派</span></a>');
			}else{
				$('#list_worker').append('<a class="list-group-item"><span class="label label-default" href="" onclick="add_event_to_map(\''+i+'\',1)">'+content+
						'</span><span class="label label-info" style="float:right" href="" onclick="show_worker_around_event('+i+')">指派</span></a>');
			}
			i++;
		}//for
		//alert(i);
			$('#remain_count').html(i+"件");
		}//success
	});

}


function show_worker_around_event(i){
	map.clearOverlays();//先清空地图上的各种覆盖物
	var user_data=worker_comdata_event[i];
	var location=worker_comdata_event[i].location;
	
	//alert(location+"-"+location[0]);
	var index=location.indexOf(',');
	var lat=location.slice(0,index);
	var log=location.slice(index+1);
	var point=new BMap.Point(lat,log);
	map.centerAndZoom(point,16);
	var myIcon=new BMap.Icon("../images/user.gif",new BMap.Size(32,32));
	var marker=new BMap.Marker(point,{icon:myIcon});
	var circle = new BMap.Circle(point,200);//距离你radius以内的
	map.addOverlay(circle);
	map.addOverlay(marker);
	
	var j=0;
	for(var item in worker_comdata_free){
		add_worker_around_in_map(i,j);
		j++;
	}
	
	
	/*$.ajax({
		url:'../data/event.json',
		type:'get',
		success:function(data){
			var size=data.size;
			for(var j=0;j<size;j++){
				add_worker_around_in_map(i,data.contents[j]);
			}
	}
	});*/
	
	
	/*var url="http://api.map.baidu.com/geosearch/v3/local?ak=O3FbLhXliGXcMDp16MdAQwGD&geotable_id=59693&location="
		+location[0]+","+location[1];
	$.ajax({
		type:"GET",
		url:url,
		dataType:"jsonp",
		success:function(data){
			var size=data.size;
			for(var j=0;j<size;j++){
			//alert(data.contents[i].address);
			//alert("data:"+data.contents[i]);
				add_worker_around_in_map(i,data.contents[j]);
				
			}
		}
	});*/
}




function add_worker_around_in_map(user_data_i,j){
	//alert("j:"+j);
//	alert("user:"+user_data+" data:"+data);
	var location=worker_comdata_free[j].location;
	if(location.length<1){
		alert(worker_comdata_free[j].name+"尚未更新位置信息");
		return;//工作人员位置信息没有的情况
	}
	var index=location.indexOf(',');
	var loc=location.slice(0,index);
	var log=location.slice(index+1);
	var point = new BMap.Point(loc,log);
	var marker= new BMap.Marker(point);
	marker.show();
	map.centerAndZoom(point, 16);
	map.addOverlay(marker);
//	var i=0;
	var content="<h4 style='margin:0 0 5px 0;padding:0.2em 0'>工作人员</h4>" + 
	"<div><p style='margin:0;line-height:1.5;font-size:13px;'>姓名："+worker_comdata_free[j].name+"</p>" + 
	"<p style='margin:0;line-height:1.5;font-size:13px;'>工作："+worker_comdata_free[j].job+"</p>" + 
	"<p style='margin:0;line-height:1.5;font-size:13px;'>电话："+worker_comdata_free[j].telephone+"</p>" + 
	"<p style='margin:0;line-height:1.5;font-size:13px;'><input type='button' value='确定指派' onclick='submit_dispatcher(\""+user_data_i+"\",\""+j+"\")'></p>" + 
	"</div>";
	var infoWindow=new BMap.InfoWindow(content);
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	marker.addEventListener("click", function(){          
		
		this.openInfoWindow(infoWindow);
	});
	
	
}
//"+user_data+","+data+"
//user_data,worker_data
function submit_dispatcher(user,worker){
	//点击确定指派，生成一张派工单
	$('#user_name')[0].value=worker_comdata_event[user].name!=null?worker_comdata_event[user].name:"未填写";
	$('#user_phone')[0].value=worker_comdata_event[user].telephone!=null?worker_comdata_event[user].telephone:"未填写";
	$('#user_addr')[0].value=worker_comdata_event[user].address!=null?worker_comdata_event[user].address:"未填写";
	$('#user_content')[0].value=worker_comdata_event[user].content!=null?worker_comdata_event[user].content:"未填写";
	//alert(worker_comdata_event[user].photo_addr);
	var pic_addr="../"+worker_comdata_event[user].photo_addr;
	$('#event_pic').attr("src",pic_addr);
	//alert("worker:"+worker);
	$('#worker_name')[0].value=worker_comdata_free[worker].name;
	$('#worker_phone')[0].value=worker_comdata_free[worker].telephone;
	
	
	$('#workerOrder').modal();
}




var worker_data;

function show_all_worker(){
	//显示所有签到的工作人员
	$.ajax({
		url:'findAllWorker',
		type:'get',
		success:handle_free_worker
	});
}






function produce_workerorder(){
	var user_name=$('#user_name')[0].value;
	var user_phone=$('#user_phone')[0].value;
	var user_addr=$('#user_addr')[0].value;
	var user_content=$('#user_content')[0].value;
	var user_photo=$('#event_pic').attr('src');
	user_photo=user_photo.slice(user_photo.indexOf('//')+1);
	//alert("user_photo:"+user_photo);
	var worker_name=$('#worker_name')[0].value;
	var worker_phone=$('#worker_phone')[0].value;
	//alert(user_name+"-"+user_phone+"-"+user_addr+"-"+user_content+"-"+worker_name+"-"+worker_phone);
	$.ajax({
		url:'addWorkorder',
		type:'post',
		data:{
			h_name:user_name,
			h_telephone:user_phone,
			address:user_addr,
			description:user_content,
			photo_addr:user_photo,
			w_name:worker_name,
			w_telephone:worker_phone
		},
		success:function(data){
			//alert(data);
			
		}
	});
	$('#workerOrder').modal('hide');//关闭模态框
	dispatcher_refresh_data();//刷新列表
	map.clearOverlays();//删除所有覆盖物
}

//event_check.js

var uncheckedOrder;
function refresh_for_unchecked_order(){
	var timesteamp=Date.parse(new Date());
	$.ajax({
		url:'findUncheckedOrder',
		type:'get',
		data:{time:timesteamp},
		success:function(data){
			handle_uncheckedOrder(data);
		}
    
	});
}
function handle_uncheckedOrder(data){
	$('#remain_order_count').html(data);
	$('#workorder_list').html(null);
	$.ajax({
		url:'../data/workorder.json',
		type:'get',
		success:function(json_data){
			uncheckedOrder=json_data;
			for(var i=0;i<data;i++){
				var content=json_data[i].description;
				$('#workorder_list').append('<a class="list-group-item" onclick="show_workorder(\''+i+'\')">'+content+'</a>')
			}
	}
	});
}
var workorder_id;
function show_workorder(i){
	workorder_id=uncheckedOrder[i].id;
	$('#user_name')[0].value=uncheckedOrder[i].h_name;
	$('#user_phone')[0].value=uncheckedOrder[i].h_telephone;
	$('#description')[0].value=uncheckedOrder[i].description;
	$('#worker_name')[0].value=uncheckedOrder[i].w_name;
	$('#worker_phone')[0].value=uncheckedOrder[i].w_telephone;
	$('#worker_feedback')[0].value=uncheckedOrder[i].w_description;
	$('#edate')[0].value=uncheckedOrder[i].e_date;
	$('#fdate')[0].value=uncheckedOrder[i].b_date;
	$('#h_photo').attr("src","../"+uncheckedOrder[i].photo_addr);
	//alert(uncheckedOrder[i].w_photo_addr);
	$('#w_photo').attr("src","../"+uncheckedOrder[i].w_photo_addr);
	
	
}

function check(){
	var score=$('#function-hint1').html();
	
	$.ajax({
		url:'updateWorkorderScore',
		type:'post',
		data:{
			score:score,
			id:workorder_id
		},
		success:function(data){
			//alert(data);
			refresh_for_unchecked_order();//再次刷新列表
			$('#user_name')[0].value=null;
			$('#user_phone')[0].value=null;
			$('#description')[0].value=null;
			$('#worker_name')[0].value=null;
			$('#worker_phone')[0].value=null;
			$('#worker_feedback')[0].value=null;
			$('#edate')[0].value=null;
			$('#fdate')[0].value=null;
			$('#h_photo').attr("src","");
			//alert(uncheckedOrder[i].w_photo_addr);
			$('#w_photo').attr("src","");
			
		}
		
	});
}



