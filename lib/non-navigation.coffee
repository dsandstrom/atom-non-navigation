_ = require 'underscore-plus'

module.exports =
class NonNavigation
  constructor: () ->

  destroy: ->

  editor: ->
    atom.workspace.getActiveTextEditor()

  moveToNextBoundary: ->
    for cursor in @cursors()
      options = @cursorOptions(scope: cursor.getScopeDescriptor())
      if position = cursor.getNextWordBoundaryBufferPosition(options)
        cursor.setBufferPosition(position)

  wordAndNonWordRegExp: (options={}) ->
    nonWordCharacters =
      atom.config.get('editor.nonWordCharacters', scope: options.scope)
    segments = ["^[\t ]*$"]
    segments.push("[^\\s#{_.escapeRegExp(nonWordCharacters)}]+")
    segments.push("\\s*[#{_.escapeRegExp(nonWordCharacters)}]?")
    new RegExp(segments.join("|"), "g")

  cursors: ->
    if @editor() then @editor().getCursors() else []

  cursorOptions: (options={}) ->
    {wordRegex: @wordAndNonWordRegExp(options)}
