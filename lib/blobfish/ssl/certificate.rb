module Blobfish
  module Ssl
    class Certificate < OpenSSL::X509::Certificate
      def serial_hex
        serial.to_s(16)
      end
    end
  end
end