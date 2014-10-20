class Form

  constructor: (@api) ->
    @el     = $('#search-form')
    @input  = @el.find('input')
    @initBindings()

  initBindings: ->
    @el.on 'submit', (event) =>
       event.preventDefault()
       @findArtist @input.val()
 
  findArtist: (query) ->
    Q($.ajax
        url: "#{@api}/v1/search",
        data: 
          q:    query,
          type: 'artist'
     ).then( (response) =>
      debugger
     ).fail( (error) =>
     ).done()


@Form = Form
