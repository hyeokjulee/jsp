<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*, java.security.*, java.io.*, java.net.*" trimDirectiveWhitespaces="true" %>
<%
	try {
        String apiUrl =  "https://sslsms.cafe24.com/smsSenderPhone.php";
        String userAgent = "Mozilla/5.0";
        String postParams = "userId=austiny&passwd=b05c71225043952fdd34a1a93abaf4ab";
        URL obj = new URL(apiUrl);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("User-Agent", userAgent);

        // For POST only - START
        con.setDoOutput(true);
        OutputStream os = con.getOutputStream();
        os.write(postParams.getBytes());
        os.flush();
        os.close();
        // For POST only - END

        int responseCode = con.getResponseCode();
        System.out.println("POST Response Code :: " + responseCode);

        if (responseCode == HttpURLConnection.HTTP_OK) { //success
            BufferedReader in = new BufferedReader(new InputStreamReader(
                    con.getInputStream()));
            String inputLine;
            StringBuffer buf = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                buf.append(inputLine);
            }
            in.close();
            out.print(buf.toString());
        } else {
            out.println("POST request not worked");
        }
	} catch(IOException ex){
	}
%>