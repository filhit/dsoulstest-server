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
    var statusWrapper = $("#server-status-container");
    var icon = $("#server-status-icon", statusWrapper);
    var spinner = $(".server-loading-icon", statusWrapper);
    spinner.show();

    $.ajax({
      url: "https://minetest.westeurope.cloudapp.azure.com:30001",
      success: function(data) {
        spinner.hide();

        icon.removeClass("text-secondary");
        icon.addClass("text-success");
        icon.attr("title", "Online");

        if (data.players !== undefined) {
          $("#player-count", statusWrapper).text(data.players);
          $("#players", statusWrapper).show();
        } else {
          $("#players", statusWrapper).hide();
        }

        icon.show();
      },
      error: function() {
        spinner.hide();

        icon.attr("title", "Offline");
        icon.removeClass("text-success");
        icon.addClass("text-secondary");
        $("#players", statusWrapper).hide();

        icon.show();
      },
      timeout: 3000
    });
  }

  updateServerStatus();

  setInterval(function() {
    updateServerStatus()
  }, 60 * 1000);
});
