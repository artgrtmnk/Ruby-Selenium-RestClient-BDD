require 'faker'
require 'json'

class UserData
    attr_accessor :user, :id

    def initialize
        @id = nil
        @user = {
            name: nil,
            gender: nil,
            email: nil,
            status: nil
        }
    end

    # if you want to create your own user, put it as an argument using this schema
    def generate_user_data (request_body = {
            name: Faker::Name.name, 
            gender: ['male', 'female'].sample, 
            email: Faker::Internet.email,
            status: 'active'
        })
        @user = request_body

        JSON.parse(request_body.to_json)
    end
end