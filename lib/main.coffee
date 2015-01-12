NonNavigation = require './non-navigation'

module.exports =
  activate: (state) ->
    nonNavigation = new NonNavigation()

    atom.commands.add 'atom-workspace',
      "non-navigation:move-right": =>
        nonNavigation.moveToNextBoundary()

  deactivate: ->
