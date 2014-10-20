class Spotify

  constructor: (options={})->
    @api = 'https://api.spotify.com'
    @form = new Form(@api) if options.form

 @Spotify = Spotify
