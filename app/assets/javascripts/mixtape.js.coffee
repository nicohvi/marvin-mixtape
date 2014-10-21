class Mixtape

  constructor: (options={})->
    @api = 'https://api.spotify.com/v1'
    @setupSearch() if options.search
    @playlist = new Playlist(@api) if options.playlist
    @initBindings()

  setupSearch: ->
    @spotifySearcher  = new SpotifySearcher(@api)
    @mixtapeForm      = new MixtapeForm()

  initBindings: ->
    $(document).on 'mixtape_artist', (event, artist) =>
      @mixtapeForm.setArtist(artist)

@Mixtape = Mixtape
