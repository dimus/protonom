require_relative 'import_pb'
require_relative 'import_services_pb'

module Protonom
  class Client
    def initialize(host = '0.0.0.0', port = '8080')
      @stub = Proto::Harvester::Stub.new("#{host}:#{port}",
                                         :this_channel_is_insecure)
    end

    def version
      @stub.ver(Proto::Void.new)
    end
  end
end
