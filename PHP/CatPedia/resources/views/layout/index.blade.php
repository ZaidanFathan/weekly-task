<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CatPedia</title>
    <link rel="stylesheet" href="{{ asset("css/style.css") }}" />
  </head>
  <body>
    @yield("navbar")
    

    @yield("main-content")
   
    <!-- Alert Box -->
     @yield("alert-section")
    <!-- End Alert Box -->

    <!-- Form kontak -->
     @yield("form")
 

    @yield("footer")
   

    <script src="{{ asset("js/index.js") }}"></script>
  </body>
</html>
