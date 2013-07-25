// Generated by CoffeeScript 1.6.3
(function() {
  var Retina, root;

  $.fn.imageLoad = function(fn) {
    this.load(fn);
    return this.each(function() {
      if (this.complete && this.naturalWidth !== 0) {
        return $(this).trigger("load");
      }
    });
  };

  Retina = (function() {
    function Retina(selector) {
      if (selector == null) {
        selector = 'img';
      }
      this.selector = "" + selector + "[data-at2x]";
    }

    Retina.prototype.images = function() {
      return $(this.selector).not('[data-retina="true"]');
    };

    Retina.prototype.init = function() {
      var retina;
      if (!this.isRetina()) {
        return;
      }
      retina = this;
      return $(this.images()).each(function() {
        return retina.processImage(this);
      });
    };

    Retina.prototype.update = function() {
      return this.init();
    };

    Retina.prototype.processImage = function(img) {
      img = $(img);
      return img.imageLoad(function() {
        var at2x;
        at2x = img.data('at2x');
        if (!img.attr('width')) {
          img.attr('width', img.width());
        }
        if (!img.attr('height')) {
          img.attr('height', img.height());
        }
        img.attr('src', at2x);
        return img.attr('data-retina', true);
      });
    };

    Retina.prototype.isRetina = function() {
      var mediaQuery;
      mediaQuery = "(-webkit-min-device-pixel-ratio: 1.5),                  (min--moz-device-pixel-ratio: 1.5),                  (-o-min-device-pixel-ratio: 3/2),                  (min-resolution: 1.5dppx)";
      if (root.devicePixelRatio > 1) {
        return true;
      }
      if (root.matchMedia && root.matchMedia(mediaQuery).matches) {
        return true;
      }
      return false;
    };

    return Retina;

  })();

  root = typeof exports !== "undefined" && exports !== null ? exports : window;

  root.Retina = Retina;

}).call(this);