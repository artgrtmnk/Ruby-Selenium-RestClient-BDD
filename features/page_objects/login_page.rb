require 'page-object'

class LoginPage
    include PageObject

    page_url "https://profile.oracle.com"
   
    text_field(:email_field, id: "sso_username")
    text_field(:password_field, id: "ssopassword")
    button(:login_button, id: "signin_button")
    div(:error_field, xpath: "//span[@id='errormsg']/div")
    
    def enter_email(email) 
        self.email_field = email
    end

    def enter_password(password) 
        self.password_field = password
    end

    def click_login
        login_button
    end

    def check_error_message(error_message)
        self.error_field.include?(error_message)
    end
  end