<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/LpfManage/scripts/jquery.min.js"></script>
<script type="text/javascript" src="/LpfManage/scripts/js/highcharts.js"></script>
<script type="text/javascript" src="/LpfManage/scripts/js/exporting.js"></script>
<script type="text/javascript" src='/LpfManage/scripts/js/highcharts-3d.js'></script>
 <script type="text/javascript" src='/LpfManage/scripts/js/pie.js'></script> 
 <script src="/LpfManage/scripts/js/zhu.js"></script>
<link href="/LpfManage/css/bootstrap.min.css" rel="stylesheet">
 <script type="text/javascript" >
 $(function (){
   var  flag=true;
   /* $("#change").click(function (){
    		$("#container").toggle();
    		$("#mpf").toggle();
    		if(flag==true){
    			$(this).text("切换到饼图");
    			flag=false;
    		
    		}else{
    			$(this).text("切换到柱状图");
    			flag=true;
    		}
    		
    
    });*/
    $(".btn-success").click(function(){
    	
    	var i= $(".btn-success").index(this);
    	$("#container"+i).toggle();
    		$("#mpf"+i).toggle();
    		if(flag==true){
    			$(this).text("切换到饼图");
    			flag=false;
    		
    		}else{
    			$(this).text("切换到柱状图");
    			flag=true;
    		}
    });
 });
 
 </script> 


</head>
<body onload="load();">
     
    <!--5.导入容器用于显示图表
    
   
    --> 

    <!--5.导入容器用于显示图表--> 
    <div id="mpf0" style="width: 800px;border:1px solid #ccc;margin: 30px auto;"> 
    </div> 
    <div id="container0" style="width:800px;height:400px;display:none;border:1px solid #ccc;margin: 30px auto;"></div>
    
    <div style="margin:10px auto;width:120px;">
       <button class="btn btn-success " id="change" >切换成柱状图</button>
   </div>
   
   <div id="mpf1" style="width: 800px;border:1px solid #ccc;margin:  auto;"> 
    </div>
   <div id="container1" style="width:800px;height:400px;display:none;border:1px solid #ccc;margin: 30px auto;"></div>
    
    <div style="margin:10px auto;width:120px;">
       <button class="btn btn-success " id="change1" >切换成柱状图</button>
   </div>
   
   <div id="mpf2" style="width: 800px;border:1px solid #ccc;margin:  auto;"> 
    </div>
   <div id="container2" style="width:800px;height:400px;display:none;border:1px solid #ccc;margin: 30px auto;"></div>
    
    <div style="margin:10px auto;width:120px;">
       <button class="btn btn-success " id="change2" >切换成柱状图</button>
   </div>
    	
    
  
   
</body>



</html>
