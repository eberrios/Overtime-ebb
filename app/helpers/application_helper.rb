module ApplicationHelper
  def admin_types
    ['AdminUser']
  end
  
  def active?(path)
    "active" if current_page?(path)
  end

  def notification?(eval)
    if eval.errors.any?
      eval.errors.full_messages.each do |error|
        js add_gritter(error, title: 'Overtime app Notification', sticky: false)
      end
    end
  end

  def status_label(status)
    status_span status
  end

private
  def status_span(status)
    case status
    when 'submitted'
      content_tag(:span, status.titleize, class: 'label label-primary')
    when 'approved'
      content_tag(:span, status.titleize, class: 'label label-success')
    when 'rejected'
      content_tag(:span, status.titleize, class: 'label label-danger')
    when 'pending'
      content_tag(:span, status.titleize, class: 'label label-primary')
    when 'confirmed'
      content_tag(:span, status.titleize, class: 'label label-success')
    end
  end
end
