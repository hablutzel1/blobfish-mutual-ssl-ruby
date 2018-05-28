require 'blobfish/ssl/certificate'

module Blobfish
  module Ssl

    ##
    # This middleware requires a web server configuration like the following one:
    #
    # server {
    # 	listen 443 ssl;
    # 	...
    # 	location ... {
    # 		...
    # 		proxy_set_header SSL_CLIENT_CERT $ssl_client_cert;
    # 	}
    # }
    #
    # Note that the previous example is from NGINX, but it could be performed by other web servers as long as they set the
    # HTTP header 'SSL_CLIENT_CERT' with the PEM certificate.
    #
    class Middleware
      def initialize app
        @app = app
      end

      def call env
        client_cert = env['HTTP_SSL_CLIENT_CERT']
        if client_cert
          client_cert.gsub! /\t/, ''
          client_cert = Certificate.new(client_cert)
          env['client_cert'] = client_cert
        end
        # TODO check: if the client cert is not available, evaluate to raise 'NoClientCertificateError, "No client certificate has been presented"', but some other middleware and not the final controller should have to rescue this error, isn't it?.
        @app.call(env)
      end
    end

  end
end