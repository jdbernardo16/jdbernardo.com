<!doctype html>
<html class="no-js" lang="en">
    <head>
        <% base_tag %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> | $SiteConfig.Title</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

        <% loop HeaderFooter %>
        <link rel="shortcut icon" href="$Favicon.Url" type="image/x-icon" />
        <link rel="apple-touch-icon" href="$Favicon.Url">
        <meta name="keywords" content="$SeoKeywords">
        <%-- For Twitter --%>
        <meta name="twitter:site" content="$TwitterUser" />
        <%-- For Windows --%>
        <meta name="msapplication-TileColor" content="#$BgColor" />
        <meta name="msapplication-square70x70logo" content="$MsLogoSq.Fill(70,70).URL" />
        <meta name="msapplication-square150x150logo" content="$MsLogoSq.Fill(150,150).URL" />
        <meta name="msapplication-wide310x150logo" content="$MsLogoWd.Fill(310,150).URL" />
        <meta name="msapplication-square310x310logo" content="$MsLogoSq.Fill(310,310).URL" />
        <% end_loop %>

        <% if ClassName == 'NewsArticlePage' %>
        <% loop NewsArticlePage %>
            <meta property="og:image" content="$NewsImg.Url">
            <% if $NewsTeaser %>
                <meta name="description" content="$NewsTeaser">
                <meta property="og:description" content="$NewsTeaser">
            <% end_if %>
            <meta property="og:title" content="$NewsTitle">
            <meta property="og:url" content="$Link">
        <% end_loop %>
        <% end_if %>

        <% loop HeaderFooter %>
            <meta property="og:image" content="$Logo.Url">
            <% if $SeoDescription %>
                <meta name="description" content="$SeoDescription">
                <meta property="og:description" content="$SeoDescription">
            <% else %>
                <meta name="description" content="$MetaDescription">
                <meta property="og:description" content="$MetaDescription">
            <% end_if %>
        <% end_loop %>

        <%-- For Twitter and Facebook --%>
        <meta property="og:title" content="$Title">
        <meta property="og:url" content="{$AbsoluteBaseURL}">
        <meta property="og:site_name" content="$SiteConfig.Title">
        <meta property="og:type" content="website">
        <%-- For Windows --%>
        <meta name="application-name" content="$SiteConfig.Title" />

        <% if $ExtraMeta %>
            $ExtraMeta
        <% end_if %>

        <!-- Ionicon -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css">
        
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

        <!-- Slick -->
         <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/jquery.slick/1.3.15/slick.css"/>

        <!-- Remodal -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remodal/1.0.6/remodal.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remodal/1.0.6/remodal-default-theme.min.css">

        <!-- Light Gallery -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/1.6.4/css/lightgallery.min.css">
        
        <!-- SweetAlert -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">

        <%-- Swiper --%>
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

        <%-- CSS --%>
        <%-- <link rel="stylesheet" href="$ThemeDir/js/vendor/chosen/chosen.css"> --%>
        <link rel="stylesheet" href="$ThemeDir/fonts/portfolio/stylesheet.css">
        <link rel="stylesheet" href="$ThemeDir/assets/app.css">
        
        <!--[if lt IE 9]>
        <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>
    <body class="">
        <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <% if ClassName != 'Stylesheet' %>
        <% include Header %>
        <% end_if %>

        <div class="main">

            $Layout

            <% if $Form %>
            <div class="page-loginCon">
                <div class="vertical-parent">
                    <div class="vertical-align">
                        <div class="login-frm__col">
                            <div class="login-frm__text">
                                <p>Login</p>
                            </div>
                            $Form
                        </div>
                    </div>
                </div>
            </div>
            <% end_if %>

            <% if ClassName == 'SilverStripe\ErrorPage\ErrorPage' %>
            <% if $Content %>
            <div class="page-errorCon align-c">
                <div class="vertical-parent">
                    <div class="vertical-align frm-desc">
                        $Content
                    </div>
                </div>
            </div>
            <% end_if %>
            <% end_if %>

        </div>

        <% if ClassName != 'Stylesheet' %>
        <% include Footer %>
        <% end_if %>

        <!-- !!! -->
        <script type="text/javascript">
            var pageID = '$ClassName',
            baseHref = '$BaseHref',
            themeDir = '$ThemeDir';
        </script>


        <!--Start of Tawk.to Script-->
        <%--  --%>

        <!-- Global site tag (gtag.js) - Google Analytics -->
        <%--  --%>

        <!-- Script -->
        <script type="text/javascript" src="$ThemeDir/assets/vendor.js"></script>
        <script type="text/javascript" src="$ThemeDir/assets/app.js"></script>
        
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js'></script>
        <script src='https://cdn.jsdelivr.net/jquery.counterup/1.0/jquery.counterup.min.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

        <!-- File Upload -->
        <script src="$ThemeDir/js/vendor/jquery.ui.widget.js"></script>
        <script src="$ThemeDir/js/vendor/jquery.iframe-transport.js"></script>
        <script src="$ThemeDir/js/vendor/jquery.fileupload.js"></script>
        <!--  -->


        <!-- Validate -->
        <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

        <!-- StickyFloat -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/stickyfloat/7.5.0/stickyfloat.js"></script>

        <!-- Slick -->
        <script src="https://cdn.jsdelivr.net/jquery.slick/1.4.1/slick.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script src='https://alexandrebuffet.fr/codepen/slider/slick-animation.min.js'></script>

        <!-- Remodal -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/remodal/1.0.6/remodal.min.js"></script>

        <!-- SweetAlert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <!-- Scrollify -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/scrollify/1.0.5/jquery.scrollify.min.js"></script>

        <!-- TweenMax -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/MotionPathPlugin.min.js" integrity="sha512-2vgSeT4mD0azBGIp91Fnho9fbT8ZG8zu5c+mK//TGxj4YNX2mRAwEZHtZsMRwA7ObqH6Vl7mMOdvkzNVTuhUcA==" crossorigin="anonymous"></script>

        <!-- ScrollMagic -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/plugins/animation.gsap.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/plugins/debug.addIndicators.min.js"></script>

        <!-- HoverIntent -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.hoverintent/1.10.1/jquery.hoverIntent.min.js" integrity="sha512-gx3WTM6qxahpOC/hBNUvkdZARQ2ObXSp/m+jmsEN8ZNJPymj8/Jamf8+/3kJQY1RZA2DR+KQfT+b3JEB0r9YRg==" crossorigin="anonymous"></script>
        <script src='https://www.google.com/recaptcha/api.js' async defer></script>
        <% if ClassName == 'ContactUsPage' %>
        <!-- GoogleMap -->
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdZmifNZogZcfRQ-wZy0B7yVVTd0cvPm4"></script>

        <!-- Maps -->
        <% loop ContactUsPage %>
        <script type="text/javascript">
            var mapLat = $Latitude,
                mapLng = $Longitude;

            var mapOptions = {
                zoom: 15,
                center: new google.maps.LatLng(mapLat, mapLng)
            };

            var mapElement = document.getElementById('map');
            var map = new google.maps.Map(mapElement, mapOptions);
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(mapLat, mapLng),
                map: map,
                title: 'Easytrip',
                icon: '$Pin.Url',
                animation: google.maps.Animation.DROP,
            });
            map.panBy(-100, 0);
        </script>
        <% end_loop %>

        <script src='https://www.google.com/recaptcha/api.js' async defer></script>
        <% end_if %>

        <!-- Light Gallery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/1.6.4/js/lightgallery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/lg-video@1.2.2/dist/lg-video.min.js"></script>

        <%-- Swiper --%>
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        
        <!-- Script --> 
        <script type="text/javascript" src="$ThemeDir/js/script.js"></script>
        <script type="text/javascript" src="$ThemeDir/js/animation.js"></script>
        

    </body>
</html>
