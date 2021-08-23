<%@ page import="org.apache.log4j.Logger" %>
z
<html>
<head>
   <title>Demonstration log4j usage in jsp</title>
</head>

<body>

<%
Logger log = Logger.getLogger("com.mobilefish.demo.test");
log.debug("Show DEBUG message");
log.info("Show INFO message");
log.warn("Show WARN message");
log.error("Show ERROR message");
log.fatal("Show FATAL message");
%>

<b>
   The log messages are shown in the Tomcat console and in the
   ${catalina.home}/logs/demo.log file.
</b>

</body>
</html>