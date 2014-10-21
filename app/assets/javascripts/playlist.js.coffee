class Playlist

  constructor: (@api) ->
    @el     = $('#playlist')
    @artist = @el.data('id')
    @songs  = @el.find('.songs')
    @createPlaylist()
    @initPlayer()
  
  createPlaylist: ->
    Q(@fetchRelatedArtists()).then( => @addSongs()).done()

  fetchRelatedArtists: ->
    Q( $.ajax "#{@api}/artists/#{@artist}/related-artists" )
    .then (response) =>
      @artists =  _.sample(response.artists, 5)
  
  addSongs: ->
    _.map @artists, (artist) =>
      Q(@fetchSongsForArtist(artist))
      .then( (songs) => 
        _.map songs, (song) =>
          $('<li>')
            .addClass('song')
            .text(song.name)
            .data('audio', song.preview_url)
            .appendTo(@songs)
      ).done()

  fetchSongsForArtist: (artist) ->
    Q( $.ajax "#{@api}/artists/#{artist.id}/top-tracks?country=NO" )
    .then( (response) =>
      _.sample(response.tracks, 5)
    )

  initPlayer: ->
    $(document).on 'mouseover', '.song', (event) =>
      @song = new Audio $(event.currentTarget).data('audio')
      @song.play()

    $(document).on 'mouseout', '.song', (event) =>
      @song.pause()

@Playlist = Playlist
