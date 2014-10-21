class MixtapeForm

  constructor: ->
    @el = $('#new_mixtape')
    @artistId    = $('#spotify_id')
    @artistName  = $('#artist_name')
    
  setArtist: (artist) ->
    @artistId.val(artist.id)
    @artistName.val(artist.name)

@MixtapeForm = MixtapeForm
