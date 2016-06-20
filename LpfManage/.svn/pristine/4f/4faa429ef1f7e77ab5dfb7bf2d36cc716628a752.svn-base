function refresh_for_uncase_order(){
	$.ajax({
		url:'findUncase',
		type:'get',
		success:function(data){
			$('#remain_uncase_count').html(data+"件");
			handle_uncase_data(data);
		}
	});
}
var uncase_data;
function handle_uncase_data(size){
	$.ajax({
		url:'../data/uncase.json',
		type:'get',
		success:function(data){
			uncase_data=data;
			for(var i=0;i<size;i++){
				$('#uncase_list').append('<a class="list-group-item" onclick="show_uncase(\''+i+'\')">'+data[i].content+'</a>')
			}
		}
	});
}
function show_uncase(i){
	alert(uncase_data[i]);
	$('#recom_area').html(null);
	$('#ignore_area').html(null);
	
	$('#recom_area').html("\""+uncase_data[i].content+"\",该事件不能立案,现为您推荐以下单位:");
	$('#ignore_area').html("\""+uncase_data[i].content+"\",该事件信息不清，无法处理，忽略。")
	
}
