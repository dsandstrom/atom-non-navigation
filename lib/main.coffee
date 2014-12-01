SubwordNavigation = require './non-navigation'

module.exports =
  activate: (state) ->
    atom.workspaceView.eachEditorView (editorView) ->
      nonNavigation = new NonNavigation(editorView.editor)

      editorView.command "non-navigation:move-right", ->
        nonNavigation.moveToNextBoundary()

  deactivate: ->
