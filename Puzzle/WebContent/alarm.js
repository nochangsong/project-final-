setInterval(function(){
	var url = "/Puzzle/alarm/alarmList.do";
	var list = [];
	$.ajax({
		type:"post"		// 포스트방식
		,url:url	// url 주소	
		,dataType:"json"
		,success:function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
			$("#msg").val(args.data.length);
			for(var idx=0; idx<args.data.length; idx++) {	// 새로 가져온 데이터를 데이터 갯수만큼 반복해서 붙여준다.
			 	//reset();
				alertify.log(args.data[idx].sender+"로 부터 메시지 : " + args.data[idx].content);
			}
			$(".badge").text(args.msgNum);
		}
	    ,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
	    	Console.log(e.responseText);
	    }
	});
}, 1000);