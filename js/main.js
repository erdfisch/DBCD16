// Generated by CoffeeScript 1.10.0
(function() {
  $(document).ready(function() {
    $('span.to-date').hide();
    $('.has-js').show();
    return $(".countdown span.day").fadeOut("slow", function() {
      $(".countdown span.day").text("08").fadeIn("slow");
      return $(".countdown span.month").fadeOut("slow", function() {
        $(".countdown span.month").text("04").fadeIn("slow");
        return $(".countdown span.year").fadeOut("slow", function() {
          return $(".countdown span.year").text("2016").fadeIn("slow", function() {
            return $('span.to-date').show();
          });
        });
      });
    });
  });

}).call(this);