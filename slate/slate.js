S.src('.reslate.js');

// my hyper key
slate.alias('hyper', 'ctrl;alt;cmd');

// begin config
slate.configAll({
    defaultToCurrentScreen: true,
    nudgePercentOf: 'screenSize',
    resizePercentOf: 'screenSize',
    undoOps: [
        'active-snapshot',
        'chain',
        'grid',
        'layout',
        'move',
        'resize',
        'sequence',
        'shell',
        'push'
    ]
});

// bindings
slate.bindAll({
  hyper: {
    // bars
    h: [
      $('barResize', 'left',  2),
      $('barResize', 'left',  1.5)
    ],
    j: $('barResize', 'bottom', 2),
    k: $('barResize', 'top',    2),
    l: [
      $('barResize', 'right', 2),
      $('barResize', 'right', 1.5)
    ],

    // nudge window
    right: 'nudge +5% +0',
    left: 'nudge -5% +0',
    up: 'nudge +0 -5%',
    down: 'nudge +0 +5%',

    shift: {
      // resize window
      right: 'resize +10% 0',
      left: 'resize -10% 0',
      up: 'resize 0 -10%',
      down: 'resize 0 +10%',

      r: 'relaunch'
    },

    f: $('center', 'center', 1, 1),

    return: [
      $('center', 'center', 1.1, 1.1),
      $('center', 'center', 1.2, 1.2),
      $('center', 'center', 1.5, 1.5),
      $('center', 'center', 1.8, 1.8),
      $('center', 'center', 2, 2)
    ],

    // throw to monitor
    '`': [
      'throw 0 resize',
      'throw 1 resize'
    ],
    '1': $('toss', '0', 'resize'),
    '2': $('toss', '1', 'resize'),
    '3': $('toss', '2', 'resize'),

    // direct focus
    t: $.focus('iTerm'),
    y: $.focus('Google Chrome'),
    p: $.focus('Spotify'),

    // utility functions
    z: 'undo',
    tab: 'hint'
  }
});
