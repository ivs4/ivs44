
@delete_one_ru_worker = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
# Включаем все кнопки удаления
@del_all_rus_worker = ->
  $('a.remove_worker').on 'click', ->
    window.delete_one_ru_worker($(this))
    false
  false
# Включаем кнопку добавления роли
@add_new_ru_worker = ->
  $('#add_worker_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_worker", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    # Вставляем на страницу
    $(this).parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    # Включаем у новой роли кнопку удаления
    # Её раньше не было, поэтому при зарузке страницы она не включалась
    panel.find('a.remove_worker').on 'click', ->
      window.delete_one_ru_worker($(this))
      false
    false
# Запуск всего вышеописанного
ru_ready_worker = ->
  window.add_new_ru_worker()
  window.del_all_rus_worker()
$(document).on 'page:load', ru_ready_worker # Включаем при ajax обновлении страницы
$(document).ready ru_ready_worker # Включаем при обычном обновлении страницы
# nested_finish
