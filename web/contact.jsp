<%-- 
    Document   : contact
    Created on : Oct 18, 2023, 11:32:01 AM
    Author     : ThuyVy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Pet Shop</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/jquery.selectBox.css" />
        <link rel="shortcut icon" href="favicon.html" />

    </head>
    <body>
        <div class="header">
            <%@include file="header.jsp" %>
        </div>
        <div class="container">
            

            <!-- START of INNER-CONTAINER -->
            <div class="inner-container clearfix">

                <div id="contact">

                    <h3 class="main-heading"><span>Liên hệ</span></h3>

                    <h4 class="sub-heading">Địa chỉ</h4>

                    <div class="address">                            
                        <em>Thuy Vy</em>
                        <p>Pet Shop, Layout 1, Some street 123-4, Melbourne VIC 3000, Australia</p>
                        <em>Telephone:</em>
                        <p>+61 (0) 3 9023 0074</p>
                        <em>Fax:</em>
                        <p>+61 (0) 3 9023 0074</p>                                    
                    
                    </div><!-- end of .address -->

                    <!-- START OF CONTACT FORM SECTIOIN -->
                    <div class="comments">

                        <form id="contact-form" class="comment-form" method="post" action="http://inspirythemes.com/templates/bonfire-html/mail.php">

                            <h3>Để lại lời nhắn </h3>

                            <div>
                                <fieldset class="clearfix">
                                    <label for="name">Name:</label>
                                    <input name="name" id="name" type="text" class="required" style=" background: #EEE" />
                                </fieldset>
                                <fieldset class="clearfix">
                                    <label for="email">Email:</label>
                                    <input name="email" id="email" type="text" class="required email" style=" background: #EEE" />
                                </fieldset>
                                <fieldset class="clearfix">
                                    <label for="message">Message:</label>
                                    <textarea id="message" name="message" cols="5" rows="5" class="required"style=" background: #EEE"></textarea>
                                </fieldset>
                                <fieldset class="submit-button clearfix" style="background-color: gr">
                                    <input style="background-color: gray" name="submit" type="submit" class="submit" value="Submit" />
                                </fieldset>

                                <img id="loader" src="images/loader.gif" />
                                <p id="result"></p>
                            </div>



                        </form><!-- end of #contact-form -->

                    </div>                         
                    <!-- END OF CONTACT FORM SECTIOIN-->

                </div><!-- end of #contact -->

                
            </div>
            <!-- END of INNER-CONTAINER -->



        </div><!-- end of .container -->
        <div class="footer">
            <%@include file="footer.jsp" %>
        </div>
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.selectBox.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
        <script type="text/javascript" src="js/tabs-accordian.js"></script>
        <script type="text/JavaScript" src="js/cloud-zoom.1.0.2.js"></script>
        <script type="text/javascript" src="js/jquery.animate-colors-min.js"></script>           
        <script type="text/javascript" src="js/jquery.form.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>    	
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>

