require 'solid_assert'

class Assertions
    def assert_response_code(code, response)
        assert code == response.code, "Response code is not equal #{code}"
        @basic_url = @method = @body = nil
    end
    
    def assert_response_body_contains(compare_string, response)
        p response.body
        assert response.body.include?(compare_string), "Response body doesn't contains expected payload."
    end

    def assert_response_body_not_contains(compare_string, response)
        assert !response.body.include?(compare_string), "Something went wrong."
    end
end

