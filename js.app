$( document ).ready( function (){


  var users = ["ESL_SC2", "OgamingSC2", "cretetion", "freecodecamp", "storbeck", "habathcx", "RocketBeansTV",  "argustom", "Crunk_Muffin", "volpinprops", "RobotCaleb", "noobs2ninjas", "usernm", "brunofin", "comster"]
    
  $.each( users, function( index, value ) {
    // Takes an array as parameter and ties it to a index, value used to mod the url string
      var ul = $('<div class="user col-sm-6 col-sm-offset-3">')
       
      $.getJSON('https://api.twitch.tv/kraken/channels/' + value + '?callback=?', function( data ) {
        // console.log(data)
        var ChannelObj = {
          'name': data.display_name,
          'logo': data.logo,
          'url': data.url,
          'status': data.status,
          'urlName': data.name
        }
        if(data.logo !== undefined && data.logo !== null) {
          ul.append('<img src=' + ChannelObj.logo  + '>')
        } else { 
          ul.append('<img src="https://media.giphy.com/media/SufoKsersIO2Y/giphy.gif">')}     
          ul.append('<li"><a href=https://www.twitch.tv/' + ChannelObj.urlName  + '>' +  '<h2>'  +  'Profile' + '</h2>' + '</li>')
        
        if(data.status !== 422 && data.status !== null) {
          ul.append('<li">' + '<h3>' + 'Streaming: ' + ChannelObj.status  +'</h3>'  + '</li>')
        }
        
        $('#user-box').append(ul)
      })    

       $.getJSON('https://api.twitch.tv/kraken/streams/' + value + '?callback=?', function( data ) {
         console.log(data)
         var streamObj = { 'stream': data.stream }

         if (streamObj.stream !== null && streamObj.stream !== undefined) {
            ul.prepend('<li">' + '<h3>' + value + ': Is Online' +  '</h3>' + '</li>').addClass('online-bg')
         } else if  (streamObj.stream === undefined) {
            ul.prepend('<li">' + '<h3>' + value + ': The account is closed' +  '</h3>' + '</li>').addClass('offline-bg')
         } else {
            ul.prepend('<li">' + '<h3>' + value + ': is Offline' +  '</h3>' + '</li>').addClass('offline-bg')
         }
         
       })
      
  })
  
  $('#show-online').on('click', function(){
    $('.offline-bg').hide()
    $('.online-bg' ).show()
  })
  $('#show-offline').on('click', function(){
    $('.online-bg' ).hide()
    $('.offline-bg').show()
  })
  $('#show-reset').on('click', function(){
    $('.online-bg' ).show()
    $('.offline-bg').show()
  })
    
})
