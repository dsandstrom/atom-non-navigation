NonNavigationView = require './non-navigation-view'

module.exports =
  nonNavigationView: null

  activate: (state) ->
    @nonNavigationView = new NonNavigationView(state.nonNavigationViewState)

  deactivate: ->
    @nonNavigationView.destroy()

  serialize: ->
    nonNavigationViewState: @nonNavigationView.serialize()
