$(document).ready(function() {
  function userMessage(message) {
    var newMessage = 
      '<li class="message user-message">' + 
        '<h3>' + message + '</h3>' +
      '</li>'
    $('.convo ul').append(newMessage)
  }
  
  function carResults(cars) {
    for(var i = 0; i < cars.length; i++) {
      var car = cars[i]

      var newCar = 
      '<li class="message car-message">' + 
        '<h3>' + car.name + '</h3>' +
        '<p>make: ' + car.make + '</p>' +
        '<p>year: ' + car.year + '</p>' +
        '<p>style: ' + car.style + '</p>' +
        '<p>price range: ' + car.price_range + '</p>' +
        '<p>color: ' + car.color + '</p>' +
      '</li>'
      $('.convo ul').append(newCar)
    }
    
  }
  
  $('#car-finder').on('submit', function(e) {
    e.preventDefault()

    var searchTerm = $('.search-term').val()
    userMessage(searchTerm)

    $.ajax({
      url: '/car-finder',
      method: 'get',
      dataType: 'json',
      data: {
        searchTerm: JSON.stringify(searchTerm)
      },
      complete: function(response) {        
        carResults(response.responseJSON)
      }
    })    
  })
})