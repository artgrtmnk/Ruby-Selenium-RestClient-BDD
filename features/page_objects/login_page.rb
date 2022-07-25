require 'page-object'
require 'solid_assert'

class LoginPage
    include PageObject

    page_url "https://profile.oracle.com"
   
    text_field(:email_field, id: "sso_username")
    text_field(:password_field, id: "ssopassword")
    button(:login_button, id: "signin_button")
    span(:error_message, id: "errormsg")
    
    def enter_email(email) 
        self.email_field = email
    end

    def enter_password(password) 
        self.password_field = password
    end

    def click_login
        login_button
    end

    def check_error_message(error)
        $wait.until { $driver.find_element(id: 'errormsg').text == 'Invalid username and/or password.' }

        assert self.error_message.include?(error_message), "Element doesn't contains this text."
    end
  end