module WorkerProjectsHelper
  # nested_start
  def link_to_add_worker(form, project)
    # Создаём новый объект. Аналог build в ранних примерах
    new_object = WorkerProject.new()
    # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
    # Все role_users в форме имеют свой номер
    # Мы его пока заменям на фразу new_ru
    fields = form.fields_for(:worker_projects, new_object,
      :child_index => 'new_worker') do |fr|
      render('projects/one_worker_form', fr: fr, i: 'Новый')
    end
    # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
    link_to(?#, class: 'btn btn-info',
        id: 'add_worker_link', data: {content: "#{fields}"}) do
      fa_icon("plus") + " Новый сотрудник"
    end
  end

  def link_to_remove_worker(form)
    # При удалении nested-конструкции. Она реально не удаляется
    # Соответствующий html-блок скрывается
    # При этом выставляется значение специального поля _destroy
    # По этому поля rails понимает, что связь надо удалить
    form.hidden_field(:_destroy, class: 'remove_fields') +
        # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
        link_to(?#, class: 'remove_fields remove_worker') do 
      fa_icon('times', title: 'Удалить сотрудника') + ' Удалить'
    end
  end
  def project_options()
    Project.all.collect {|p| [p.name, p.id]}
  end
  # nested_finish
end
