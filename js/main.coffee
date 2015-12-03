$(document).ready ->
  $('span.to-date').hide()

  $('.has-js').show()
  $(".countdown span.day").fadeOut "slow", ->
    $(".countdown span.day").text("08").fadeIn "slow"
    $(".countdown span.month").fadeOut "slow", ->
      $(".countdown span.month").text("04").fadeIn "slow"
      $(".countdown span.year").fadeOut "slow", ->
        $(".countdown span.year").text("2016").fadeIn "slow", ->
          $('span.to-date').show()

