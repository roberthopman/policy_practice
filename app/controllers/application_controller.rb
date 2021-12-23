class ApplicationController < ActionController::Base
  rescue_from ActionPolicy::Unauthorized do |ex|
    # Exception object contains the following information
    ex.policy #=> policy class, e.g. UserPolicy
    ex.rule #=> applied rule, e.g. :show?
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def hello
    render 'layouts/hello'
  end
end
