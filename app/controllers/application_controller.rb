class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Clearance::Authentication

  def authenticate(params)
    if request.headers['AUTH-TOKEN']
      return nil unless user = User.where(remember_token: request.headers['AUTH-TOKEN']).first
      sign_in user
    else
      User.authenticate(params[:session][:email], params[:session][:password])
    end
  end
  #rest of class omitted for bevity
end
