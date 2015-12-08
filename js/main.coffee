$(document).ready ->
  dateNow = moment()
  dateThen = moment("2016-04-08")
  daysRemaining = dateThen.diff(dateNow, "days")
  $(".number").text(daysRemaining)
