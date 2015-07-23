// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  userPagination.init();
});

var userPagination = {
  init: function() {
    userPagination.initEvents();
  },

  initEvents: function() {

    $('.my-numbers').on('click', 'a', function(event) {
      event.preventDefault();

      userPagination.ajaxCall($(this).html());
    })
  },

  ajaxCall: function(pageNumber) {
    $.ajax({
      method: 'GET',
      url: '/users_paginated_ajax/' + pageNumber + '/',
      success: function(data) {
        $('table').html("");
        if ($('ul.people')) {
          $('ul.people').remove();
        }
        $('body').append('<ul class="people"></ul>');
        data.forEach(function(el) {
          var line = "";
          line += "   ID: ";
          line += el.id;
          line += "   Name: ";
          line += el.name;
          line += "   Email: ";
          line += el.email;
          line += "<br>"
          $('ul.people').append("<li>" + line + "</li>");
        });


        var el = document.getElementsByClassName('my-numbers')
        var $allLis = $(el).children();
        var actualNum = parseInt(pageNumber);

        if(pageNumber === '1' || pageNumber === '2' || pageNumber === '3') {

          <%= link_to "1", users_paginated_ajax_path(pageNumber) %>
          $allLis[0].innerHTML = "<a href=''>1</a>";
          $allLis[1].innerHTML = "<a href=''>2</a>";
          $allLis[2].innerHTML = "<a href=''>3</a>";
          $allLis[3].innerHTML = "<a href=''>4</a>";
          $allLis[4].innerHTML = "<a href=''>5</a>";
        } else {
          $allLis[0].innerHTML = "<a href=''>" + (parseInt(pageNumber,10) - 2) + "</a>";
          $allLis[1].innerHTML = "<a href=''>" + (parseInt(pageNumber,10) - 1) + "</a>";
          $allLis[2].innerHTML = "<a href=''>" + (parseInt(pageNumber,10)) + "</a>";
          $allLis[3].innerHTML = "<a href=''>" + (parseInt(pageNumber,10) + 1) + "</a>";
          $allLis[4].innerHTML = "<a href=''>" + (parseInt(pageNumber,10) + 2) + "</a>";
        }
      },
      error: function(error) {
        console.log(error);
      }
    });
  }


}
