function jugeNext(){
	var juge=confirm("是否进入下一阶段");
	if(juge===false){
		return false;
	}
 }
 
 
 
 function jugeTeam(team,compe){
	 team=window.encodeURI(team);
	 var status=1;
	 var juge=confirm("是否进入下一阶段");
		if(juge===false){
			return false;
		}
		var data={"sup.signUp_team":team,
				  "sup.signUp_competition.compe_id":compe
		};
			$.ajax({
				url:"student_jugeTeamPcturePath",
				type:'post',
				data:data,
				dataType:'json',
				async:false,
				success:function(data){
					console.log(data);
					if(data==="true"){
						status=1;
					}else{
						alert("团队成员上传附件不完整！");
						status=2;
					}
					
				}
			});
			team=window.encodeURI(team);
			if(status==1){
				window.location.href="student_nextStage?sup.signUp_team="+team+"&sup.signUp_competition.compe_id="+compe;
			}
			return false;
		}
 	
 