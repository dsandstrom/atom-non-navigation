describe 'NonNavigation', ->
  [workspaceElement, editorView, editor, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    jasmine.attachToDOM(workspaceElement)

    waitsForPromise ->
      atom.workspace.open('sample.rb').then (o) ->
        editor = o
        editorView = atom.views.getView(editor)

    waitsForPromise ->
      atom.packages.activatePackage('non-navigation')

  describe 'move-right', ->
    it 'does not change an empty file', ->
      atom.commands.dispatch editorView, 'non-navigation:move-right'
      cursorPosition = editor.getCursorBufferPosition()
      expect(cursorPosition.row).toBe 0
      expect(cursorPosition.column).toBe 0

    it "on blank line, before '\n'", ->
      editor.insertText("\n")
      editor.moveUp 1
      atom.commands.dispatch editorView, 'non-navigation:move-right'
      cursorPosition = editor.getCursorBufferPosition()
      expect(cursorPosition.row).toBe 1
      expect(cursorPosition.column).toBe 0

    describe "on '.word.'", ->
      it "when cursor is in the middle", ->
        editor.insertText(".word.\n")
        editor.moveUp 1
        editor.moveRight() for n in [0...2]
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 5

    describe "on 'sub_word '", ->
      it "when cursor is at the beginning", ->
        editor.insertText("sub_word \n")
        editor.moveUp 1
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 8

    describe "on 'camelCase '", ->
      it "when cursor is at the beginning", ->
        editor.insertText("camelCase \n")
        editor.moveUp 1
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 9

    describe "on '()'", ->
      it "when cursor is at the beginning", ->
        editor.insertText("()\n")
        editor.moveUp 1
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 1

      it "when cursor is in the middle", ->
        editor.insertText("()\n")
        editor.moveUp 1
        editor.moveRight 1
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 2

    describe "on '{()}'", ->
      it "when cursor is at the beginning", ->
        editor.insertText("{()}\n")
        editor.moveUp 1
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 1

      it "when cursor is right of the opening bracket", ->
        editor.insertText("{()}\n")
        editor.moveUp 1
        editor.moveRight 1
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 2

      it "when cursor is right of the opening parenthesis", ->
        editor.insertText("{()}\n")
        editor.moveUp 1
        editor.moveRight 2
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 3

      it "when cursor is right of the closing parenthesis", ->
        editor.insertText("{()}\n")
        editor.moveUp 1
        editor.moveRight 3
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 4

    describe "on single quotes", ->
      it "when cursor is at the beginning", ->
        editor.insertText("''\n")
        editor.moveUp 1
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 1

      it "when cursor is in the middle", ->
        editor.insertText("''\n")
        editor.moveUp 1
        editor.moveRight 1
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 2

    describe "on double quotes", ->
      it "when cursor is at the beginning", ->
        editor.insertText('""\n')
        editor.moveUp 1
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 1

      it "when cursor is in the middle", ->
        editor.insertText('""\n')
        editor.moveUp 1
        editor.moveRight 1
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 2

    describe "on consecutive spaces", ->
      it "when cursor is at the beginning", ->
        editor.insertText('  var\n')
        editor.moveUp 1
        atom.commands.dispatch editorView, 'non-navigation:move-right'
        cursorPosition = editor.getCursorBufferPosition()
        expect(cursorPosition.row).toBe 0
        expect(cursorPosition.column).toBe 2
