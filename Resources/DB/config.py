"""Variable file containing configuration parameters"""
def get_variables(arg):
    """
    :param arg: which set of variables to return
    :return: a python dictionary containing variables with default values
    """
    if arg == 'db':                 return db

db = dict(DB_NAME='students_db',
          DB_USER_NAME='root',
          DB_USER_PASSWORD='password',
          DB_HOST='localhost',
          DB_PORT='3306'
          )