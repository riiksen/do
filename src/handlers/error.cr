module Amber
  module Pipe
    # The Error Handler catches RouteNotFound and returns a 404.  It will
    # response based on the `Accepts` header as JSON or HTML.  It also catches
    # any runtime Exceptions and returns a backtrace in text/html format.
    class Error < Base
      def call(context : HTTP::Server::Context)
        begin
          raise Amber::Exceptions::RouteNotFound.new(context.request) if context.invalid_route?
          call_next(context)
        rescue ex : Amber::Exceptions::Forbidden
          context.response.status_code = 403
          error = ErrorController.new(context, ex)
          context.response.print(error.forbidden)
        rescue ex : Amber::Exceptions::RouteNotFound
          context.response.status_code = 404
          error = ErrorController.new(context, ex)
          context.response.print(error.not_found)
        rescue ex : Exception
          context.response.status_code = 500
          error = ErrorController.new(context, ex)
          context.response.print(error.internal_server_error)
        end
      end
    end
  end
end
