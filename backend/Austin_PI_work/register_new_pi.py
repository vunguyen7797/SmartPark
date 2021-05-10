import requests
import json
from collections import namedtuple

# this class will assist in registering the Pi's. If you are testing implementation, the pi_id should be 123456
# class piRegistration:

server_url: 'http://localhost:8080/data'

def register_pi(pi_id):
    r = requests.post('http://localhost:8080/addPI/{0}'.format(pi_id))
    print(r)
        
def get_keys(pi_id):
    # get server's public and private keys
    r = requests.get('http://localhost:8080/piIdentification/{0}'.format(pi_id))
    # decoded_response = r.json()
    keys = json.loads(r.text, object_hook=lambda d: namedtuple('keys', d.keys()) (*d.values()))

    # print(keys.publicKey, '\n', keys.privateKey)

    return keys

    # # print(json.dumps(r_dict, indent = 4))
    # print(r_dict['publicKey'][1]['publicKey'])
    # # print('Server public key: {0}'.format())

# testing
# register_pi(123456)
# get_keys(123456)