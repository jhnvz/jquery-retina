$.fn.imageLoad = (fn) ->
  @load fn
  @each ->
    $(@).trigger "load" if @complete and @naturalWidth isnt 0

class Retina

  constructor: (selector='img') ->
    @selector = "#{selector}[data-at2x]"

  images: ->
    $(@selector).not('[data-retina="true"]')

  init: ->
    return unless @isRetina()

    retina = @

    $(@images()).each ->
      retina.processImage(@)

  update: ->
    @init()

  processImage: (img) ->
    img  = $(img)

    img.imageLoad ->
      at2x = img.data('at2x')

      img.attr('width', img.width()) unless img.attr('width')
      img.attr('height', img.height()) unless img.attr('height')
      img.attr('src', at2x)
      img.attr('data-retina', true)

  isRetina: ->
    mediaQuery = "(-webkit-min-device-pixel-ratio: 1.5),
                  (min--moz-device-pixel-ratio: 1.5),
                  (-o-min-device-pixel-ratio: 3/2),
                  (min-resolution: 1.5dppx)"
    return true  if root.devicePixelRatio > 1
    return true  if root.matchMedia and root.matchMedia(mediaQuery).matches
    false

root = exports ? window
root.Retina = Retina