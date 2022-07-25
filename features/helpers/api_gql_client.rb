require 'rest-client'
require 'solid_assert'
require 'json'

class GraphqlClient
    @@token = ENV['GOREST_TOKEN']
    @@method = :post
    @@headers = {
        Authorization: "#{@@token}"
    }

    @url = nil
    @body = nil

    attr_accessor :url, :body

    def send_request
        RestClient::Request.execute(
            url: @url,
            method: @@method,
            headers: @@headers,
            payload: @body)
    end

    def set_body_formatted multiline_body
        @body=JSON.parse(eval(multiline_body).to_json)
    end
end