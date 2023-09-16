module ApplicationHelper
  def errors_for(form, field)
    tag.p(form.object.errors[field].try(:first), class: 'text-danger')
  end
end
