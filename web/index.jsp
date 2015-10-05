<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <title>NFD-Admin Login</title>
        <script>
            window.location.hash="no-back-button";
            window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
            window.onhashchange=function(){window.location.hash="no-back-button";}
        </script>        
    </head>

    <body class="hold-transition lockscreen">
        <!-- Automatic element centering -->
        <div class="lockscreen-wrapper">
            <div class="lockscreen-logo">
                <a href="http://NAWANDARFILMS.com" class="text-black"><b>Nawandar</b>FILMS</a>
            </div>
            <!-- User name -->
            <div class="lockscreen-name">Admin Login</div>

            <!-- START LOCK SCREEN ITEM -->
            <div class="lockscreen-item">
                <!-- lockscreen image -->
                <div class="lockscreen-image">
                    <img src="dist/img/avatar5.png" alt="User Image">
                </div>
                <!-- /.lockscreen-image -->                
                <!-- lockscreen credentials (contains the form) -->
                <div class="lockscreen-credentials">
                    <html:form action="/admin_Login">
                        <div class="input-group">
                            <input type="password" class="form-control" placeholder="Unique Key" name="key"/>                            
                            <div class="input-group-btn">
                                <button class="btn" type="submit"><i class="fa fa-arrow-right text-muted"></i></button>
                            </div>
                        </div>
                    </html:form>
                </div><!-- /.lockscreen credentials -->
            </div><!-- /.lockscreen-item -->

            <div class="help-block text-center">
                <html:errors property="login" />
                Enter your password to Login
            </div>
            <div class="lockscreen-footer text-center">
                Copyright &copy; 2015 <b><a href="http://NAWANDARFILMS.com" class="text-black">NAWANDAR FILMS</a></b><br>
                All rights reserved
            </div>
        </div><!-- /.center -->


    </body>
</html:html>
