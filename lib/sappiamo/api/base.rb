module Sappiamo
  module API
    class Base

      attr_reader :credentials

      def initialize(credentials)
        @credentials = credentials
      end

      class << self
        def api_model(klass)
          class_eval <<-END
            def api_model
              #{klass}
            end
          END
        end
      end

      protected
        def request(method, credentials, path, options = {})
          params = {
            path:    path,
            options: options,
            method:  method
          }

          httparty_options = {
            query:  options[:query],
            body:   options[:body],
            format: :plain,
            headers: {
              "Accept"       => "application/json",
              "Content-Type" => "application/json; charset=utf-8",
              "User-Agent"   => "Sappiamo/#{Sappiamo::VERSION}",
              "Authorization"  => "Token token=#{credentials.access_token}"
            }.update(options[:headers] || {})
          }

          response = HTTParty.send(method, "#{credentials.host}#{path}", httparty_options)
          params[:response] = response.inspect.to_s

          case response.code
          when 200..201
            response
          when 400
            raise Sappiamo::BadRequest.new(response, params)
          when 401
            raise Sappiamo::AuthenticationFailed.new(response, params)
          when 404
            raise Sappiamo::NotFound.new(response, params, "Do you have sufficient privileges?")
          when 500
            raise Sappiamo::ServerError.new(response, params)
          when 502
            raise Sappiamo::Unavailable.new(response, params)
          when 503
            raise Sappiamo::RateLimited.new(response, params)
          else
            raise Sappiamo::InformSappiamo.new(response, params)
          end
        end

    end
  end
end
