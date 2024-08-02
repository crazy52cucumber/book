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
                    url: "search?m=autocomplete",
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
                    }
                });
            },
            //조회를 위한 최소글자수
            minLength: 1,
            select: function(target) {
                const selected = document.getElementById("academy_name");
                selected.innerText = target.innerText;

            }
        });
    })
    $(function search(target){
        $.ajax({
            type: 'GET',
            dataType: 'JSON',
            url: "search?m=search",
            date: {acd_name : $("#academy_name").val()},
            error: function(err){
                console.log(err);
            },
            success: function(data){
                var checkWord = $("#academy_name").val();
                console.log(checkWord);

            }
        })
    });



</script>

<body onload="$('#academy_name').focus()">
   <input id = "academy_name" name = "acd_name" class="search-bar" type="text" placeholder="학원을 검색해주세요." size="50px">
</body>