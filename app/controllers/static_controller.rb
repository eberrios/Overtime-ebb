class StaticController < ApplicationController
  def home
    if admin_types.include?(current_user.type)
      @pending_approvals = Post.submitted
      @recent_audit_items = AuditLog.last(10)
    else
      
      @pending_audit_confirmations = AuditLog.where("user_id= #{current_user[:id]}")#current_user.audit_logs
    end
  end
end