// Add any global JavaScript here

$(document).on('turbolinks:load', function() {
  $('body').on('click', '.message .close', function() {
    $(this)
      .closest('.message')
      .transition('fade');
  });
});
