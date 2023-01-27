<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>sms - jsp </title>
        
        <script type="text/javascript">
            function setPhoneNumber(val) {
                var numList = val.split("-");
                document.smsForm.sphone1.value = numList[0];
                document.smsForm.sphone2.value = numList[1];
	            if(numList[2] != undefined){
	                    document.smsForm.sphone3.value = numList[2];
	        	}
            }

            function loadJSON() {
                var data_file = "/calljson.jsp";
                var http_request = new XMLHttpRequest();
                try {
                    // Opera 8.0+, Firefox, Chrome, Safari
                    http_request = new XMLHttpRequest();
                } catch (e) {
                    // Internet Explorer Browsers
                    try {
                        http_request = new ActiveXObject("Msxml2.XMLHTTP");

                    } catch (e) {

                        try {
                            http_request = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {
                            // Eror
                            alert("지원하지 않는브라우저!");
                            return false;
                        }

                    }
                }
                http_request.onreadystatechange = function() {
                    if (http_request.readyState == 4) {
                        // Javascript function JSON.parse to parse JSON data
                        var jsonObj = JSON.parse(http_request.responseText);
                        if (jsonObj['result'] == "Success") {
                            var aList = jsonObj['list'];
                            var selectHtml = "<select name=\"sendPhone\" onchange=\"setPhoneNumber(this.value)\">";
                            selectHtml += "<option value='' selected>발신번호를 선택해주세요</option>";
                            for (var i = 0; i < aList.length; i++) {
                                selectHtml += "<option value=\"" + aList[i] + "\">";
                                selectHtml += aList[i];
                                selectHtml += "</option>";
                            }
                            selectHtml += "</select>";
                            document.getElementById("sendPhoneList").innerHTML = selectHtml;
                        }
                    }
                }

                http_request.open("GET", data_file, true);
                http_request.send();
            }
        </script>
    </head>

    <body onload="loadJSON()">
	    <form method="post" name="smsForm" action="smsCheck.jsp">
	        <input type="hidden" name="action" value="go"> 발송타입
	        <span>
	          <input type="radio" name="smsType" value="S">단문(SMS)</span>
	        <span>
	          <input type="radio" name="smsType" value="L">장문(LMS)</span>
	        <br /> 제목 :
	        <input type="text" name="subject" value="제목"> 장문(LMS)인 경우(한글30자이내)
	        <br /> 전송메세지
	        <textarea name="msg" cols="30" rows="10" style="width:455px;">내용입력</textarea>
	        <br />
	        <br />
	        <p>단문(SMS) : 최대 90byte까지 전송할 수 있으며, 잔여건수 1건이 차감됩니다.
	            <br /> 장문(LMS) : 한번에 최대 2,000byte까지 전송할 수 있으며 1회 발송당 잔여건수 3건이 차감됩니다.
	        </p>
	        <br />받는 번호
	        <input type="text" name="rphone" value="011-111-1111"> 예) 011-011-111 , '-' 포함해서 입력.
	        <br />이름삽입번호
	        <input type="text" name="destination" value="" size=80> 예) 010-000-0000|홍길동
	        <br /> 보내는 번호
	        <input type="hidden" name="sphone1" value="010">
	        <input type="hidden" name="sphone2" value="2737">
	        <input type="hidden" name="sphone3" value="3944">
	        <span id="sendPhoneList"></span>
	        <br />예약 날짜
	        <input type="text" name="rdate" maxlength="8"> 예)20090909
	        <br />예약 시간
	        <input type="text" name="rtime" maxlength="6"> 예)173000 ,오후 5시 30분,예약시간은 최소 10분 이상으로 설정.
	        <br />return url
	        <input type="text" name="returnurl" maxlength="64" value="">
	        <br /> test flag
	        <input type="text" name="testflag" maxlength="1"> 예) 테스트시: Y
	        <br />nointeractive
	        <input type="text" name="nointeractive" maxlength="1"> 예) 사용할 경우 : 1, 성공시 대화상자(alert)를 생략.
	        <br />반복설정
	        <input type="checkbox" name="repeatFlag" value="Y">
	        <br /> 반복횟수
	        <select name="repeatNum">
	            <option value="1">1</option>
	            <option value="2">2</option>
	            <option value="3">3</option>
	        </select> 예) 1~10회 가능.
	        <br />전송간격
	        <select name="repeatTime"> 예)15분 이상부터 가능.
	            <option value="15">15</option>
	            <option value="20">20</option>
	            <option value="25">25</option>
	        </select>분마다
	        <br>
	        <input type="submit" value="전송">
	        <br/>이통사 정책에 따라 발신번호와 수신번호가 같은 경우 발송되지 않습니다.
	    </form>
    </body>
	<script type="text/javascript">
	(function(){
	window["loaderConfig"] = "/TSPD/?type=21";
	})();
	
	</script>
	
	<script type="text/javascript" src="/TSPD/?type=18"></script>
	
	<APM_DO_NOT_TOUCH>
	
	<script type="text/javascript">
	(function(){
	window.eJMy=!!window.eJMy;try{(function(){(function(){})();var b=74;try{var aa,ka,pa=c(60)?1:0;for(var sa=(c(233),0);sa<ka;++sa)pa+=c(710)?2:3;aa=pa;window.Qa===aa&&(window.Qa=++aa)}catch(a){window.Qa=aa}var e=!0;function va(a){var d=16;a&&(document[f(d,134,121,131,121,114,121,124,121,132,137,99,132,113,132,117)]&&document[p(d,134,121,131,121,114,121,124,121,132,137,99,132,113,132,117)]!==t(68616527650,d)||(e=!1));return e}function t(a,d){a+=d;return a.toString(36)}
	function p(a){var d=arguments.length,g=[];for(var h=1;h<d;++h)g.push(arguments[h]-a);return String.fromCharCode.apply(String,g)}function xa(){}va(window[xa[t(1086780,b)]]===xa);va(typeof ie9rgb4!==t(1242178186125,b));va(RegExp("\x3c")[t(1372131,b)](function(){return"\x3c"})&!RegExp(t(42815,b))[t(1372131,b)](function(){return"'x3'+'d';"}));
	var ya=window[f(b,171,190,190,171,173,178,143,192,175,184,190)]||RegExp(p(b,183,185,172,179,198,171,184,174,188,185,179,174),p(b,179))[f(b,190,175,189,190)](window["\x6e\x61vi\x67a\x74\x6f\x72"]["\x75\x73e\x72A\x67\x65\x6et"]),za=+new Date+(c(537)?6E5:881139),Da,Ea,Fa,Ha=window[f(b,189,175,190,158,179,183,175,185,191,190)],Ka=ya?c(908)?29889:3E4:c(518)?6E3:3972;
	document[p(b,171,174,174,143,192,175,184,190,150,179,189,190,175,184,175,188)]&&document[f(b,171,174,174,143,192,175,184,190,150,179,189,190,175,184,175,188)](p(b,192,179,189,179,172,179,182,179,190,195,173,178,171,184,177,175),function(a){var d=15;document[f(d,133,120,130,120,113,120,123,120,131,136,98,131,112,131,116)]&&(document[p(d,133,120,130,120,113,120,123,120,131,136,98,131,112,131,116)]===f(d,119,120,115,115,116,125)&&a[p(d,120,130,99,129,132,130,131,116,115)]?Fa=!0:document[p(d,133,120,
	130,120,113,120,123,120,131,136,98,131,112,131,116)]===t(68616527651,d)&&(Da=+new Date,Fa=!1,w()))});function f(a){var d=arguments.length,g=[];for(var h=1;h<d;h++)g[h-1]=arguments[h]-a;return String.fromCharCode.apply(String,g)}function w(){if(!document[f(20,133,137,121,134,141,103,121,128,121,119,136,131,134)])return!0;var a=+new Date;if(a>za&&(c(622)?6E5:324941)>a-Da)return va(!1);var d=va(Ea&&!Fa&&Da+Ka<a);Da=a;Ea||(Ea=!0,Ha(function(){Ea=!1},c(534)?1:0));return d}w();
	var La=[c(97)?17795081:10278024,c(261)?27611931586:2147483647,c(466)?1558153217:1254692768];function Ma(a){var d=69;a=typeof a===t(1743045607,d)?a:a[f(d,185,180,152,185,183,174,179,172)](c(264)?36:46);var g=window[a];if(!g||!g[f(d,185,180,152,185,183,174,179,172)])return;var h=""+g;window[a]=function(k,l){Ea=!1;return g(k,l)};window[a][p(d,185,180,152,185,183,174,179,172)]=function(){return h}}for(var Na=(c(73),0);Na<La[f(b,182,175,184,177,190,178)];++Na)Ma(La[Na]);
	va(!1!==window[p(b,175,148,151,195)]);window.Ga=window.Ga||{};window.Ga.Vb="080d165b2f194000d8fd5625e9f5348cb1396bafd85f8947dc2088e68a8a7d01567e15f7c851702a1b9eb48c50d90bc50b01288fcb6a752e6bf4c371ad62bd353c47355331516518";function B(a){var d=+new Date;if(!document[f(10,123,127,111,124,131,93,111,118,111,109,126,121,124,75,118,118)]||d>za&&(c(65)?6E5:670608)>d-Da)var g=va(!1);else g=va(Ea&&!Fa&&Da+Ka<d),Da=d,Ea||(Ea=!0,Ha(function(){Ea=!1},c(133)?1:0));return!(arguments[a]^g)}function c(a){return 691>a}(function Sa(a){return a?0:Sa(a)*Sa(a)})(!0);})();}catch(x){}finally{ie9rgb4=void(0);};function ie9rgb4(a,b){return a>>b>>0};
	})();
	
	</script>
	</APM_DO_NOT_TOUCH>
	
	<script type="text/javascript" src="/TSPD/0853a021f8ab2000423a4c77f8e18ef2bdbb07fdf105c044b8ed7e17c8953af8a04702cee9861478?type=9"></script>
</html>