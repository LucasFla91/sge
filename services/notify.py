import requests


class Notify:

    def __init__(self):
        self.__base_url = 'https://webhook.site'


    def send_event(self, data):
        requests.post(
            url=f'{self.__base_url}/fc89bd21-abb0-4acf-805f-9c1c5e116887',
            json=data,
        )
