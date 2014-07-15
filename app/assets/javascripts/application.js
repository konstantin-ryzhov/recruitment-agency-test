// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery.ui.datepicker
//= require jquery.ui.datepicker-ru
//= require magicsuggest
//= require_tree .

$(document).on('page:change', function ()
{
  $("#skill_select").magicSuggest({
    autoSelect: false,
    maxSelection: null,
    hideTrigger: true,
    highlight: false,
    cls: 'form-control-addition',
    selectionCls: 'selection-addition',

    method: 'get',
    data: '/skills.json',
    valueField: 'name',
    displayField: 'name',

    placeholder: 'Укажите умения...',
    noSuggestionText: 'Нет совпадений...'
  });

  $("#valid_until").datepicker();
});
