<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<meta charset="utf-8">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function(){
        $.ui.autocomplete.prototype._renderItem = function (ul, item) {
            item.label = item.label.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + $.ui.autocomplete.escapeRegex(this.term) + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
            return $("<li></li>")
                .data("item.autocomplete", item)
                .append("<a>" + item.label + "</a>")
                .appendTo(ul);
        };
        $( "#academy_name" ).autocomplete({
            source : function( request, response ) {
                $.ajax({
                    type: 'post',
                    url: "?m=search",
                    dataType: "json",
                    data: {acd_name : $("#academy_name").val()},
                    success: function(data) {
                        response(
                            $.map(data, function(item) {
                                console.log(item);
                                return {
                                    label: item.academy_name,
                                    value: item.academy_name
                                }
                            })
                        );
                    }
                    ,error : function (){
                        alert("검색 실패");
                    }
                });
            },
            //조회를 위한 최소글자수
            minLength: 1,
            select: function( event, ui ) {
                // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
                alert("선택된 아이템: " + ui.item.value);
            }
        });
    })
</script>

<body onload="$('#academy_name').focus()">
    <input id = "academy_name" name = "academy_name" class="search-bar" type="text" placeholder="학원을 검색해주세요." size="200px">
</body>