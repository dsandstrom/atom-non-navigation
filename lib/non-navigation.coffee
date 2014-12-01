_ = require 'underscore-plus'
# {Point} = require 'atom'

module.exports =
class NonNavigation
  constructor: (@editor) ->

  destroy: ->

  moveToNextBoundary: ->
    for cursor in @cursors()
      scope = scope or cursor.getScopeDescriptor()
      if position = cursor.getNextWordBoundaryBufferPosition(@cursorOptions(scope))
        cursor.setBufferPosition(position)

  wordAndNonWordRegExp: (scope, options={}) ->
    nonWordCharacters = atom.config.get(scope, 'editor.nonWordCharacters')
    segments = ["^[\t ]*$"]
    segments.push("[^\\s#{_.escapeRegExp(nonWordCharacters)}]+")
    segments.push("[#{_.escapeRegExp(nonWordCharacters)}]?")
    new RegExp(segments.join("|"), "g")

  cursors: ->
    if @editor then @editor.getCursors() else []

  cursorOptions: (scope, options={}) ->
    {wordRegex: @wordAndNonWordRegExp(scope, options)}
