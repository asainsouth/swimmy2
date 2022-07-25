// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require('../fadeIn')
require('./preview')


//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require_tree .

window.onload = function() {
// ↪︎ windowがロードされた時にアクションを実行するように設定
  if (document.getElementById("area")) {
    // ↪︎ areaのIDがある場合に処理を実行させる（これがないとチャット画面がなくても常にJavaScriptが動いてしまいます）
    var scrollPosition = document.getElementById("area").scrollTop;
    // ↪︎ area要素のスクロールされた時の最も高い場所を取得
    var scrollHeight = document.getElementById("area").scrollHeight;
    // ↪︎ area要素自体の最も高い場所を取得
    document.getElementById("area").scrollTop = scrollHeight;
    // ↪︎ area要素のスクロールされた時の最も高い場所をarea要素自体の最も高い場所として指定してあげる
  }
}

//初回読み込み、リロード、ページ切り替えで動く。
$(document).on('turbolinks:load', function() {
  $(function() {
    // ウインドウ読み込み時とリサイズ時に発動
    $(window).on('load resize', function() {
      // フッターの高さを変数に格納
      var footerH = $('footer').height();

      $('body').css('padding-bottom', footerH + 'px')

    });
  });
});