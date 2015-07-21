Common = {
    'error_message':                    'xpath=//*[@class="flash error"]',
}

Login = {
    'username_field':                   'id=username',
    'password_field':                   'id=password',
    'login_button':                     'xpath=//*[@id="login"]/button',
   # 'error_message':                    'xpath=//*[@class="flash error"]',
}

def get_variables(arg):
    if arg == 'Common':                 return Common
    if arg == 'Login':                  return Login


