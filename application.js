$(function() {
  $("#start-server").on("click", function() {
    $.post({
      url: "https://s2events.azure-automation.net/webhooks?token=n5zFt0iz8jVCw%2fHew5idtikwpUnrEe1l7ZrpqazXYv4%3d",
      complete: function() {
        // CORS is not enabled for azure automation webhooks. Complete is the only callback we get.
        // https://feedback.azure.com/forums/246290-automation/suggestions/15318723-cors-support-for-azure-automation-webhooks
        $('#server-start-modal').modal()
      }
    });
  });

  var updateServerStatus = function() {
    var statusWrapper = $("#server-status");
    $(".js-loader").show()

    $.ajax({
      url: "https://minetest.westeurope.cloudapp.azure.com:30001",
      success: function() {
        $(".js-loader").hide();

        statusWrapper.removeClass("badge-secondary");
        statusWrapper.addClass("badge-success");
        statusWrapper.text("Online");
        statusWrapper.show();
      },
      error: function() {
        $(".js-loader").hide();

        statusWrapper.removeClass("badge-success");
        statusWrapper.addClass("badge-secondary");
        statusWrapper.text("Offline");
        statusWrapper.show();
      },
      timeout: 3000
    });
  }

  updateServerStatus();

  setInterval(function() {
    updateServerStatus()
  }, 60 * 1000);
});
