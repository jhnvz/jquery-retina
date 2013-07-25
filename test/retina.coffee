describe 'Retina', ->

  describe 'constructor', ->

    beforeEach ->
      @retina = new Retina

    it "selector defaults to 'img[data-at2x]'", ->
      @retina.selector.should.equal 'img[data-at2x]'

    it 'selector can be overidden', ->
      new Retina('img.retinafy').selector.should.equal 'img.retinafy[data-at2x]'


  context 'with Retina display', ->

    before ->
      global.window.devicePixelRatio = 1.5

    describe 'isRetina()', ->

      it 'should return true', ->
        retina = new Retina
        retina.isRetina().should.equal true

    describe 'init()', ->

      before (done) ->
        $('#mocha').append('<img src="fixtures/logo.png" data-at2x="fixtures/logo@2x.png">')

        retina = new Retina
        retina.init()

        $('img').imageLoad ->
          done()

      it 'should set the correct src attribute based on at2x attribute', ->
        $('img').attr('src').should.equal 'fixtures/logo@2x.png'

      it 'should set correct width attribute on images', ->
        $('img').attr('width').should.equal '275'

      it 'should set correct height attribute on images', ->
        $('img').attr('height').should.equal '95'

      it 'should set data-retina attribute to true', ->
        $('img').attr('data-retina').should.equal 'true'

    describe 'update()', ->

      before (done) ->
        $('#mocha').append('<img src="fixtures/logo.png" data-at2x="fixtures/logo@2x.png">')

        retina = new Retina
        retina.init()

        $('#mocha').append('<img src="fixtures/logo.png" data-at2x="fixtures/logo@2x.png" id="updated">')

        retina.update()

        $('img#updated').imageLoad ->
          done()

      it 'should set the correct src attribute based on at2x attribute', ->
        $('img#updated').attr('src').should.equal 'fixtures/logo@2x.png'

      it 'should set correct width attribute on images', ->
        $('img#updated').attr('width').should.equal '275'

      it 'should set correct height attribute on images', ->
        $('img#updated').attr('height').should.equal '95'

      it 'should set data-retina attribute to true', ->
        $('img#updated').attr('data-retina').should.equal 'true'

  context 'without Retina display', ->

    before ->
      global.window.devicePixelRatio = 0.9

    describe 'isRetina()', ->

      it 'should return false', ->
        retina = new Retina
        retina.isRetina().should.equal false

    describe 'init()', ->

      before (done) ->
        $('img').remove()

        $('#mocha').append('<img src="fixtures/logo.png" data-at2x="fixtures/logo@2x.png">')

        retina = new Retina
        retina.init()

        $('img').imageLoad ->
          done()

      it 'should not set the src attribute based on at2x attribute', ->
        $('img').attr('src').should.equal 'fixtures/logo.png'

      it 'should not set width attribute on images', ->
        should.not.exist $('img').attr('width')

      it 'should not set height attribute on images', ->
        should.not.exist $('img').attr('height')

      it 'should not set data-retina attribute to true', ->
        should.not.exist $('img').attr('data-retina')
