HTMLWidgets.widget({

  name: 'finalchart',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

      var chart = null ;

  return {

      renderValue: function(x) {
//
//
      if (chart === null ) {
      var aLittleBit = Math.PI / 100000;
      var now = x.year,
          height = x.height - 50 ,
          width = x.width + 50,
          threshold = x.threshold,
          labelThreshold = x.labelThreshold,
          animationDuration = x.animationDuration,
          margin = x.margin,
          arcPadding = x.arcPadding,
          infoPopupDelay = x.infoPopupDelay,
          arcWidth = x.arcWidth,
          sourcePadding = x.sourcePadding,
          targetPadding = x.targetPadding,
          labelPadding = x.labelPadding,
          curveFactor = x.curveFactor,
          maxRegionsOpen = x.maxRegionsOpen ;


     chart = Globalmigration.chart(x.data, {

        now: now,
        height : height ,
        width : width ,
        animationDuration: animationDuration,
        margin: margin,
        arcPadding: arcPadding,
        arcWidth : arcWidth,
        curveFactor : curveFactor,
        maxRegionsOpen : maxRegionsOpen,
        infoPopupDelay : infoPopupDelay,
        sourcePadding: sourcePadding,
        labelPadding: labelPadding,
        targetPadding: targetPadding,
        element:  el ,


        layout: {
          threshold: threshold,
          labelThreshold: labelThreshold,
          colors: x.data.reg_col

        }
      });

    /* var timeline =  Globalmigration.timeline(chart, {
          now: now,
          element: el
        });
*/
      chart.draw(now) ;

     el.chart = chart ;

      }

    el.chart.draw(x.year) ;

//
//
        // TODO: code to render the widget, e.g.

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
