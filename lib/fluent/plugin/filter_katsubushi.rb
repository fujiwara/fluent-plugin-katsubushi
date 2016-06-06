# -*- coding: utf-8 -*-
module Fluent
  class KatsubushiFilter < Filter
    require 'memcached'
    Fluent::Plugin.register_filter('katsubushi', self)

    config_param :id_key,     :string,  :default => 'id'
    config_param :integer,    :bool,    :default => true
    config_param :host,       :string,  :default => 'localhost'
    config_param :port,       :integer, :default => 11212

    def configure(conf)
      super
    end

    def start
      super
      @client = ::Memcached.new(["#{@host}:#{@port}"])
    end

    def shutdown
      super
    end

    def filter(tag, time, record)
      tries = 3
      while tries >= 0 do
        begin
          id = @client.get('1', false)
          record[@id_key] = @integer ? id.to_i : id.to_s
        rescue => e
          $log.warn("Couldn't get id from katsubushi: #{e}") if tries == 0
          @client.reset
        ensure
          tries = tries - 1
        end
      end
      record
    end
  end if defined?(Filter) # Support only >= v0.12
end
