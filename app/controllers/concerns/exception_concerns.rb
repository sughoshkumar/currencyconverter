module ExceptionConcerns
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :standard_exception
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotUnique, with: :record_invalid
  end

  protected

  def standard_exception(exception)
    message = exception.message || 'Internal server error'
    send_error_message(message, status: :internal_server_error)
  end

  def record_invalid(exception)
    send_error_message(exception.message, status: :unprocessable_entity)
  end

  private

  def send_error_message(message, meta = {}, **options)
    # https://jsonapi.org/format/#error-objects
    render json: { errors: [{ title: message, meta: meta }] }, **options
  end

end
