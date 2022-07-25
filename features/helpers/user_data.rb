require 'faker'
require 'json'

class UserData
    @user = nil
    
    attr_accessor :user

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

    def check_for_default_data(query)
        case
        when query.include?('createUser')
            if query.include? 'default_email@gmail.com'
                query['default_email@gmail.com'] = Faker::Internet.email
                query['Default User'] = Faker::Name.name
                query['male'] = ['male', 'female'].sample
            end
        when query.include?('user(id') || query.include?('updateUser') || query.include?('deleteUser')
            if query.include? '99999'
                query['99999'] = @user['id'].to_s
            end
        end
        query
    end

    def set_user_from_response(response)
        query_json = JSON.parse(response.body)
        @user = query_json['data']['createUser']['user']
    end
end