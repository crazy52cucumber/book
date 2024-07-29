<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ajax test</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
        $(function(){
            $("#academy_name").on("keyup", function(){
                $.ajax({
                    url: "main.do?m=search",
                    type: "POST",
                    data: {acd_name:$("#academy_name").val()},
                    datatype:'json',
                    success: function(data){
                        var html = "";
                        html += "<center>";
                        html += "<table border='1' width='50%'>";
                        html += "<tr>";
                        html += "<th>번호</th>";
                        html += "<th>학원명</th>";
                        html += "<th>주소</th>";
                        html += "<th>날짜</th>";
                        html += "</tr>";

                        if(data.length == 0){
                            html += "<tr>";
                            html += "<td colspan='4' align='center'>검색 결과 없음</td>";
                            html += "</tr>";
                        }else{
                            for(const list of data){
                                html += "<tr>";
                                html += "<td align='center'>"+list.board_seq+"</td>";
                                html += "<td align='center'>"+list.academy_name+"</td>";
                                html += "<td align='center'>"+list.addr+"</td>";
                                html += "<td align='center'>"+list.ldate+"</td>";
                                html += "</tr>";
                            }
                        }
                        html += "</table>";
                        html += "</center>";

                        $("#seq").val("");
                        $("#container").html(html);
                    }
                });
            });
        });

    </script>
</head>
</html>