require 'rest-client'

class BaseClient
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
            method: @method,
            headers: @@headers,
            payload: @body)
    end
end