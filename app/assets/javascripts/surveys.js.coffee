Surveys = {
  init: ->
    $('.choice input[type=text]').bind 'click', (e) ->
      txt = $(e.target)
      chk = txt.parent().find('label input[type=checkbox]')
      if chk.length > 0
        elm = chk
      else
        elm = txt.parent().find('label input[type=radio]')
      elm.prop('checked', 'checked')

    $('.choice input[type=text]').bind 'blur', (e) ->
      txt = $(e.target)
      chk = txt.parent().find('label input[type=checkbox]')
      if chk.length > 0
        elm = chk
      else
        elm = txt.parent().find('label input[type=radio]')
      elm.prop('checked', 'checked') unless txt.val() == ''
      elm.prop('checked', '') if txt.val() == ''
}

$ Surveys.init
