class ApplicationController < ActionController::API
  before_action :authenticate_request, except: :index
  after_action :track_tenant_action, except: :index
  attr_reader :current_user
  include ExceptionHandler

  def index
    @amount_users = User.count
    @amount_questions = Question.count
    @amount_answers = Answer.count
    @tenants = Tenant.all.order(requests_amount: :desc)
    @tenants_requests_total = Tenant.all.sum(:requests_amount)
  end

  private
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def track_tenant_action
    if @current_user
      @current_user.requests_amount += 1
      @current_user.save
    end
  end
end
