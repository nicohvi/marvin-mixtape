class MixtapeForm

  constructor: ->
    @el          = $('#new_mixtape')
    @button      = $('input[type=submit]')
    @artistId    = $('#spotify_id')
    @artistName  = $('#artist_name')
    
  setArtist: (artist) ->
    @artistId.val(artist.id)
    @artistName.val(artist.name)
    @enable()

  enable: ->
    @button.attr('disabled', false)

  disable: ->
    @button.attr('disabled', true)

@MixtapeForm = MixtapeForm
