class TenantsController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register]


  def login
    authenticate params[:full_name]
  end

  private
  def authenticate(full_name)
    command = AuthenticateTenant.call(full_name)

    if command.success?
      render json: {
        access_token: command.result,
        message: 'Login Successful'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
   end

end
