require 'rest-client'
require_relative 'base_client.rb'

class ApiClient < BaseClient
    def set_request_method(method)
        method.downcase!
        case method
        when 'get'
            :get
        when 'post'
            :post
        when 'patch'
            :patch
        when 'delete'
            :delete
        else
            fail 'Not implemented or incorrect method.'
        end
    end
end