// Generated by CoffeeScript 1.8.0
(function() {
  $(document).ready(function() {
    var dateNow, dateThen, daysRemaining;
    dateNow = moment();
    dateThen = moment("2016-04-08");
    daysRemaining = dateThen.diff(dateNow, "days");
    return $(".number").text(daysRemaining);
  });

}).call(this);