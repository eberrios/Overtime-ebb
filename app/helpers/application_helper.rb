module ApplicationHelper
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


 
end
