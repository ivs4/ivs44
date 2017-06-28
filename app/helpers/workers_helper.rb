module WorkersHelper
  def new_department_form(form)
    form.fields_for(:department, Department.new) do |fr|
      render('workers/one_department_form', fr: fr)
    end
  end
  def worker_options()
    Worker.all.pluck('id')
  end
  def department_for_select
      Department.all.collect {|x| [x.name, x.id]}
  end
end
