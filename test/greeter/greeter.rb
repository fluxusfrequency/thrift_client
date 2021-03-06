#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

module Greeter
  class Client
    include ::Thrift::Client

    def greeting(name)
      send_greeting(name)
      return recv_greeting()
    end

    def send_greeting(name)
      send_message('greeting', Greeting_args, :name => name)
    end

    def recv_greeting()
      result = receive_message(Greeting_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'greeting failed: unknown result')
    end

    def yo(name)
      send_yo(name)
    end

    def send_yo(name)
      send_message('yo', Yo_args, :name => name)
    end
  end

  class Processor
    include ::Thrift::Processor

    def process_greeting(seqid, iprot, oprot)
      args = read_args(iprot, Greeting_args)
      result = Greeting_result.new()
      result.success = @handler.greeting(args.name)
      write_result(result, oprot, 'greeting', seqid)
    end

    def process_yo(seqid, iprot, oprot)
      args = read_args(iprot, Yo_args)
      @handler.yo(args.name)
      return
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class Greeting_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    NAME = 1

    FIELDS = {
      NAME => {:type => ::Thrift::Types::STRING, :name => 'name'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Greeting_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Yo_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    NAME = 1

    FIELDS = {
      NAME => {:type => ::Thrift::Types::STRING, :name => 'name'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Yo_result
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end

