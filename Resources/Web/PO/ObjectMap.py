"""Returns a python dictionary containing objects relevant to the page requested.  Saves defining variables in each Page Object file"""
def get_variables(arg):
    """
    Returns objects for the page requested

    Arguments:
      |  :arg      | page name to return objects for   |

    """

    if arg == 'Common':                 return Common
    if arg == 'Login':                  return Login

Common = dict(error_message='xpath=//*[@class="flash error"]')

Login = dict(username_field     =            'id=username',
             password_field     =            'id=password',
             login_button       =            'xpath=//*[@id="login"]/button')
