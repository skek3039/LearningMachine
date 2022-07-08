/** 관리자페이지_ 학생관리 부분 js
 *  작성자 : 이희진 / 수정일자 : 2022.07.07
 */
 
 
/*function search(){
	let u_name= document.getElementById("u_name").value;
		$.ajax({
		url:"./admin_studentSearch",
		type:"get",
		dataType:"json",
		data:{"u_name" : u_name},
		success:function(data){
			var list = data.list;
			var html =  "<table><tr><th>이름</th><th>아이디</th><th>포인트</th><th>신고횟수</th><th>";
			$.each(list, function(){
				html += "<tr><td>" + list[index].u_name" + </td><td>" + list[index].u_id + "</td>";
				html += "<tr><td>" + list[index].u_paypoint" + </td><td>" + list[index].u_banned + "</td>";
			});
			html += "</table>";
			$("#student").empty();
			$("#student").append(html);
		},
		error:function(request, status, error){
			alert("통신에러");
		}
	});
}
 */