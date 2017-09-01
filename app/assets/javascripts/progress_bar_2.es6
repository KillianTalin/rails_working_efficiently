if (document.getElementById("progress-bar_2") != null) {
  var bar = new ProgressBar.Line("#progress-bar_2", {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 1400,
    color: '#FFEA82',
    trailColor: '#eee',
    trailWidth: 1,
    svgStyle: {width: '100%', height: '100%'},
    text: {
      style: {
        // Text color.
        // Default: same as stroke color (options.color)
        color: '#999',
        position: 'absolute',
        right: '0',
        top: '30px',
        padding: 0,
        margin: 0,
        transform: null
      },
      autoStyleContainer: false
    },
    from: {color: '#FEAA00'},
    to: {color: '#ED6A5A'},

    step: (state, bar) => {
      bar.path.setAttribute('stroke', state.color);
    }
  });

  var percentDone = document.getElementById("progress-bar_2").dataset.percent_done;
  bar.animate(percentDone/100);  // Number from 0.0 to 1.0
}
