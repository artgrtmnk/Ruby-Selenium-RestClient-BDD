require 'rest-client'
require 'json'

class ApiClient
    attr_accessor :basic_url, :token, :method, :headers, :body

    def initialize
        @basic_url = nil
        @method = nil
        @headers = { Authorization: ENV['GOREST_TOKEN'] }
        @body = nil
    end

    def send_request
        RestClient::Request.execute(
            url: @basic_url,
            method: self.set_request_method,
            headers: @headers,
            payload: @body)
    end

    private

    def set_request_method
        @method.downcase!
        case @method
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