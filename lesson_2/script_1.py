import requests

fkey=open('key.txt', 'r')
key = fkey.read()

response = requests.get('https://api.openweathermap.org/data/2.5/weather?q=Gomel&appid=%s' %(key))
if response.status_code != 200:
    print("Error:", response.status_code)  

#requests has internal json parser
json_output = response.json()
description = (json_output['weather'][0]['main'])
temp = (json_output['main']['temp'])
temp_feels_like = (json_output['main']['feels_like'])
print('Weather in Gomel: %s\nTemperature is %s, but feels likes %s' %(description,temp ,temp_feels_like))