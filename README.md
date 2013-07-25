jQuery Retina [![Build Status](https://travis-ci.org/jhnvz/jquery-retina.png?branch=test/setup-travis)](https://travis-ci.org/jhnvz/jquery-retina)
=============

Simple retina display optimization with jQuery.

How it works
------------

jQuery Retina swaps images based on a `data-at2x` attribute and sets the correct width and height attributes based on the original image. It also works nicely on asynchronous requests.

Installation
------------

1. Add jQuery `<script src="jquery.js"></script>`
2. Add jQuery Retina `<script src="js/jquery.retina.js"></script>`

Usage
------------

Add a `data-at2x` attribute to your images:

```html
<img src="image.png" data-at2x="image@2x.png">
```

Initialize jQuery Retina:

```javascript
var retina = new Retina
retina.init()
```

When using a custom selector:

```javascript
var retina = new Retina('img.some_class')
```

After images are added to the DOM asynchronously:

```javascript
retina.update()
```

Note on Patches/Pull Requests
------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
------------

Copyright (c) 2013 Johan van Zonneveld. See LICENSE for details.
