module ApplicationHelper
  def errors_for(form, field)
    tag.p(form.object.errors[field].try(:first), class: 'display: block; color: $danger;')
  end
end
