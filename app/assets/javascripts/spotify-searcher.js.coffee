class SpotifySearcher

  constructor: (@api) ->
    @el       = $('#search-form')
    @input    = @el.find('input')
    @artists  = $('#artists') 
    @initBindings()

  initBindings: ->
    @el.on 'submit', (event) =>
       event.preventDefault()
       @clearArtists()
       @findArtist @input.val()

    $(document).on 'click', '.artist', (event) =>
      $artist = $(event.currentTarget)
      @setArtist($artist)
      @chooseArtist($artist)
      $(document).trigger 'mixtape_artist', @artist

  clearArtists: ->
    @artists.html('')

  findArtist: (query) ->
    Q($.ajax
        url: "#{@api}/search",
        data: 
          q:    query,
          type: 'artist'
     ).then( (response) =>
      @listArtists(response.artists.items)
     ).fail( (error) =>
      console.log(error)
     ).done()

  listArtists: (artists) ->
    _.map artists, (artist) =>
      @artists.append @createArtist(artist)  

  createArtist: (artist) ->
    image = $('<img>').attr('src', artist.images[artist.images.length-2].url) if artist.images.length > 0 
    name = $('<span>').text(artist.name)
    $('<li>')
      .addClass('artist')
      .data('id', artist.id)
      .data('name', artist.name)
      .append(name)
      .append(image)

  setArtist: ($artist) ->
    @artist = 
      id:   $artist.data('id')
      name: $artist.data('name')

  chooseArtist: ($artist) ->
    $('.chosen').removeClass('chosen')
    $artist.addClass('chosen')

@SpotifySearcher = SpotifySearcher
