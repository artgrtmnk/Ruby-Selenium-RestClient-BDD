class ApiHelpers
    def set_body_formatted multiline_body
        JSON.parse(eval(multiline_body).to_json)
    end
end