department_change_new = ->
  if($("#worker_department_id").length > 0)
    alert("Сначала выберите форму редактирования.\nКнопка (Выбрать существующую/редактировать)")
  else
    elem = $("#department-change")
    data = elem.attr("data-content-new")
    elem.attr("data-content-new", elem.html())
    elem.html(data)
    window.datepicker_activation_by_item(elem)
  false


department_change_exist = ->
  elem1 = $("#worker_department_attributes_id")
  elem2 = $("#worker_department_id")
  if(elem1.length == 0 && elem2.length == 0)
    alert("Сначала выберите форму редактирования.\nКнопка (Cоздать/редактировать)")
  else
    elem = $("#department-change")
    data = elem.attr("data-content-exist")
    elem.attr("data-content-exist", elem.html())
    elem.html(data)
    window.datepicker_activation_by_item(elem)
  false

all_activities = ->
  $("#department-change-new-btn").click department_change_new
  $("#department-change-exist-btn").click department_change_exist
  # 
  # Нужную траницу определяем по её url - "workers/new"
  if(location.href.indexOf("workers/new") != -1)
    $("#department-change-new-btn").add("#department-change-exist-btn").remove()
    department_change_new()

$(document).ready all_activities
$(document).on 'page:load', all_activities



