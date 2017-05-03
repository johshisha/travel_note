// http://buf-material.github.io/blog/2014/10/13/datetime-as-start-end-set-on-bootstrap3-datetimepicker/
$(function(){

  // .datepicker_start へのdatetimepicker設定
  $('.datepicker_start').datetimepicker({

    // カレンダー表示言語
    // bootstrap-datetimepicker.ja.js が必要
    //language: 'ja',

    // 月日ピッカーと時間ピッカーを隣に表示する
    //sideBySide: true,

    // 日時フォーマット
    format: 'YYYY-MM-DD',
    pickTime: false,

  });

  // .datepicker_end へのdatetimepicker設定
  $('.datepicker_end').datetimepicker({

    // カレンダー表示言語
    // bootstrap-datetimepicker.ja.js が必要
    //language: 'ja',

    // 月日ピッカーと時間ピッカーを隣に表示する
    //sideBySide: true,

    // 日時フォーマット
    format: 'YYYY-MM-DD',
    pickTime: false,

  });

  // set a minimum date of start_at
  $('.datepicker_start').on("dp.change",function (e) {
    $('.datepicker_end').data("DateTimePicker").setMinDate(e.date);
    $('.datepicker_end').show();
  });

  // set a maximum date of end_at
  $('.datepicker_end').on("dp.change",function (e) {
    $('.datepicker_start').data("DateTimePicker").setMaxDate(e.date);
  });

});
