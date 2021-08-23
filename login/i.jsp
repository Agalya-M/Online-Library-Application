<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log" %>

<html>
<head>
   <title>Demonstration log4j usage in jsp</title>
</head>

<body>

<!-- Demonstrate different log levels -->
<log:debug>Show DEBUG message.</log:debug>
<log:info>Show INFO message.</log:info>
<log:warn>Show WARN message.</log:warn>
<log:error>Show ERROR message.</log:error>
<log:fatal>Show FATAL message.</log:fatal>

<!-- Demonstrate where to put the log messages -->
<log:fatal>Message embedded within the open and close tags.</log:fatal>
<log:fatal message="Message passed as an attribute to the tag" />
<log:fatal category="com.mobilefish.demo.index">
   Using category attribute.
</log:fatal>

<b>
   The log messages are shown in the Tomcat console and in the
   ${catalina.home}/logs/demo.log file.
</b>

</body>
</html>