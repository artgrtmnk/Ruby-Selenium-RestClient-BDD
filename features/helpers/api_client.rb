require 'rest-client'
require 'json'

class ApiClient
    @@token = ENV['GOREST_TOKEN']
    @@headers = {
        Authorization: "#{@@token}"
    }

    @url = nil
    @body = nil
    @method = nil

    attr_accessor :url, :method, :body

    def send_request
        RestClient::Request.execute(
            url: @url,
            method: self.set_request_method,
            headers: @@headers,
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