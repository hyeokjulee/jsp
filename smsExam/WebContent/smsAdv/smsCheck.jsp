<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.security.*, java.io.*, java.net.*, java.util.Base64.*" %>
<%!
	/**==============================================================
	  Description        :  사용 함수 선언
	==============================================================**/
	 /**
	 * nullcheck
	 * @param str, Defaultvalue
	 * @return
	 */
	
	 public static String nullcheck(String str,  String Defaultvalue ) throws Exception
	 {
	      String ReturnDefault = "" ;
	      if (str == null)
	      {
	          ReturnDefault =  Defaultvalue ;
	      }
	      else if (str == "" )
	     {
	          ReturnDefault =  Defaultvalue ;
	      }
	      else
	      {
	                  ReturnDefault = str ;
	      }
	       return ReturnDefault ;
	 }
	 /**
	 * BASE64 Encoder
	 * @param str
	 * @return
	 */
	public static String base64Encode(String str)  throws java.io.IOException {
	    Encoder encoder = Base64.getEncoder();
	    byte[] strByte = str.getBytes("UTF-8");
	    String result = encoder.encodeToString(strByte);
	    return result ;
	}
	
	/**
	 * BASE64 Decoder
	 * @param str
	 * @return
	 */
	public static String base64Decode(String str)  throws java.io.IOException {
	    Decoder decoder = Base64.getDecoder();
	    byte[] strByte = decoder.decode(str);
	    String result = new String(strByte);
	    return result ;
	}
%>
<%
	/**==============================================================
	  Description        : 캐릭터셋 정의
	  EUC-KR: @ page contentType="text/html;charset=EUC-KR
	  UTF-8: @ page contentType="text/html;charset=UTF-8
	==============================================================**/
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/**==============================================================
	  Description        :  사용자 샘플코드
	==============================================================**/
	String charsetType = "UTF-8"; //EUC-KR 또는 UTF-8
	
	request.setCharacterEncoding(charsetType);
	response.setCharacterEncoding(charsetType);
	String  action     = nullcheck(request.getParameter("action"), "");

	    String sms_url = "";
	    sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
	    String user_id = base64Encode("austiny"); // SMS아이디
	    String secure = base64Encode("b05c71225043952fdd34a1a93abaf4ab");//인증키
	    String msg = base64Encode(nullcheck(request.getParameter("msg"), ""));
	    String rphone = base64Encode(nullcheck(request.getParameter("rphone"), ""));
	    String sphone1 = base64Encode("010");
	    String sphone2 = base64Encode("2737");
	    String sphone3 = base64Encode("3944");
	    String rdate = base64Encode(nullcheck(request.getParameter("rdate"), ""));
	    String rtime = base64Encode(nullcheck(request.getParameter("rtime"), ""));
	    String mode = base64Encode("1");
	    String subject = "";
    
	    String testflag = base64Encode(nullcheck(request.getParameter("testflag"), ""));
	    String destination = base64Encode(nullcheck(request.getParameter("destination"), ""));
	    String repeatFlag = base64Encode(nullcheck(request.getParameter("repeatFlag"), ""));
	    String repeatNum = base64Encode(nullcheck(request.getParameter("repeatNum"), ""));
	    String repeatTime = base64Encode(nullcheck(request.getParameter("repeatTime"), ""));
//	    String returnurl = nullcheck(request.getParameter("returnurl"), "");
	    String nointeractive = nullcheck(request.getParameter("nointeractive"), "");
	    String smsType = base64Encode("S");
	
	    String[] host_info = sms_url.split("/");
	    String host = host_info[2];
	    String path = "/" + host_info[3];
	    int port = 80;
	
	    // 데이터 맵핑 변수 정의
	    String arrKey[]
	        = new String[] {"user_id","secure","msg", "rphone","sphone1","sphone2","sphone3","rdate","rtime"
	                    ,"mode","testflag","destination","repeatFlag","repeatNum", "repeatTime", "smsType", "subject"};
	    String valKey[]= new String[arrKey.length] ;
	    valKey[0] = user_id;
	    valKey[1] = secure;
	    valKey[2] = msg;
	    valKey[3] = rphone;
	    valKey[4] = sphone1;
	    valKey[5] = sphone2;
	    valKey[6] = sphone3;
	    valKey[7] = rdate;
	    valKey[8] = rtime;
	    valKey[9] = mode;
	    valKey[10] = testflag;
	    valKey[11] = destination;
	    valKey[12] = repeatFlag;
	    valKey[13] = repeatNum;
	    valKey[14] = repeatTime;
	    valKey[15] = smsType;
	    valKey[16] = subject;
	
	    String boundary = "";
	    Random rnd = new Random();
	    String rndKey = Integer.toString(rnd.nextInt(32000));
	    MessageDigest md = MessageDigest.getInstance("MD5");
	    byte[] bytData = rndKey.getBytes();
	    md.update(bytData);
	    byte[] digest = md.digest();
	    for(int i =0;i<digest.length;i++)
	    {
	        boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
	    }
	    boundary = "---------------------"+boundary.substring(0,11);
	
	    // 본문 생성
	    String data = "";
	    String index = "";
	    String value = "";
	    for (int i=0;i<arrKey.length; i++)
	    {
	        index =  arrKey[i];
	        value = valKey[i];
	        data +="--"+boundary+"\r\n";
	        data += "Content-Disposition: form-data; name=\""+index+"\"\r\n";
	        data += "\r\n"+value+"\r\n";
	        data +="--"+boundary+"\r\n";
	    }
	
	    //out.println(data);
	
	    InetAddress addr = InetAddress.getByName(host);
	    Socket socket = new Socket(host, port);
	    // 헤더 전송
	    BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
	    wr.write("POST "+path+" HTTP/1.0\r\n");
	    wr.write("Content-Length: "+data.length()+"\r\n");
	    wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
	    wr.write("\r\n");
	
	    // 데이터 전송
	    wr.write(data);
	    wr.flush();
	
	    // 결과값 얻기
	    BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(),charsetType));
	    String line;
	    String alert = "";
	    ArrayList tmpArr = new ArrayList();
	    while ((line = rd.readLine()) != null) {
	        tmpArr.add(line);
	    }
	    wr.close();
	    rd.close();

	    //out.println("<script>location.href='success.jsp';</script>");
		//모달로 발송 성공 창 띄우기 - 창 제목 "SMS 발송 성공" 내용 "문자메시지 발송 성공하였습니다."
		request.setAttribute("title", "SMS 발송 성공");
		request.setAttribute("msg", "문자메시지 발송 성공하였습니다.");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">
	        <%=request.getAttribute("title") %>
	        </h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <%=request.getAttribute("msg") %>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-warning" onclick="location.href='smsForm.jsp'">back</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">close</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script>
		$(function() {
			$("#exampleModal").modal("show");
		});
	</script>
</body>
</html>