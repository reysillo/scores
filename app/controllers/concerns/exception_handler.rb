module ExceptionHandler

  def self.included(base)
    base.class_eval do

      rescue_from Exception do |e|
        render json: {error: e.message}, status: :internal_error
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end  

    end
  end

end

