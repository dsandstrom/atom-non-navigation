NonNavigation = require './non-navigation'
{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: (state) ->
    nonNavigation = new NonNavigation()

    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',

    'non-navigation:move-right': -> nonNavigation.moveToNextBoundary()

  deactivate: -> @subscriptions.dispose()
