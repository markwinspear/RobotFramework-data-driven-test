import re
import requests
import simplejson as json

from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn

USERNAME_ACCESS_KEY = re.compile('^(http|https):\/\/([^:]+):([^@]+)@')

def update_saucelabs_test_name(name, remote_url=''):
    # Parse username and access_key from the remote_url
    assert USERNAME_ACCESS_KEY.match(remote_url), 'Incomplete remote_url.'
    username, access_key = USERNAME_ACCESS_KEY.findall(remote_url)[0][1:]

    # Get selenium session id from the keyword library
    # This is how we know which Sauce test to update!
    selenium = BuiltIn().get_library_instance('Selenium2Library')
    job_id = selenium._current_browser().session_id

    # Prepare payload & headers
    token = (':'.join([username, access_key])).encode('base64').strip()
    payload = {'name': name}
    headers = {'Authorization': 'Basic {0}'.format(token)}

    # Put the test status to Sauce Labs
    url = 'https://saucelabs.com/rest/v1/{0}/jobs/{1}'.format(username, job_id)
    response = requests.put(url, data=json.dumps(payload), headers=headers)
    assert response.status_code == 200, response.text


def update_saucelabs_test_result(name, status, tags=[], remote_url=''):
    # Parse username and access_key from the remote_url
    assert USERNAME_ACCESS_KEY.match(remote_url), 'Incomplete remote_url.'
    username, access_key = USERNAME_ACCESS_KEY.findall(remote_url)[0][1:]

    # Get selenium session id from the keyword library
    # This is how we know which Sauce test result to update!
    selenium = BuiltIn().get_library_instance('Selenium2Library')
    job_id = selenium._current_browser().session_id

    # Prepare payload & headers
    token = (':'.join([username, access_key])).encode('base64').strip()
    payload = {'name': name,
               'passed': status == 'PASS',
               'tags': tags}
    headers = {'Authorization': 'Basic {0}'.format(token)}

    # Put the test status to Sauce Labs
    url = 'https://saucelabs.com/rest/v1/{0}/jobs/{1}'.format(username, job_id)
    response = requests.put(url, data=json.dumps(payload), headers=headers)
    assert response.status_code == 200, response.text

    # Insert the Sauce video url we receive from the response into our results file
    video_url = json.loads(response.text).get('video_url')
    if video_url:
        logger.info('<a href="{0}">video.flv</a>'.format(video_url), html=True)
