require 'dwca_hunter'
require 'dwc_archive'

require_relative 'import_pb'
require_relative 'import_services_pb'
require_relative 'protonom/itis'

module Protonom
  class Client
    def initialize(host = '0.0.0.0', port = '7777')
      @stub = Proto::Harvester::Stub.new("#{host}:#{port}", :this_channel_is_insecure)
    end

    def version
      @stub.ver(Proto::Void.new)
    end

    def import(iter)
      @stub.import(iter.each_item)
    end
  end
end
