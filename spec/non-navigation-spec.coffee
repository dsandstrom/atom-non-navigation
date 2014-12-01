{WorkspaceView} = require 'atom'
NonNavigation = require '../lib/non-navigation'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "NonNavigation", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('non-navigation')

  describe "when the non-navigation:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.non-navigation')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspaceView.element, 'non-navigation:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.non-navigation')).toExist()
        atom.commands.dispatch atom.workspaceView.element, 'non-navigation:toggle'
        expect(atom.workspaceView.find('.non-navigation')).not.toExist()
