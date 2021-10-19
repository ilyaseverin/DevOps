#!/bin/bash
apikey=$(</mnt/d/EPAM-DevOps/key.txt)
read Keypress

case "$Keypress" in
    c)
        type=metric
        ;;
    f)
        type=imperial
        ;;
    k)
        ;;
esac
response=`curl -s "api.openweathermap.org/data/2.5/weather?q=Gomel&units=$type&appid=$apikey"`


description=$(echo $response | jq -r '.weather[]|.main')
temp=$(echo $response | jq -r '.main.temp')
temp_feels_like=$(echo $response | jq -r '.main.feels_like')
echo "Current weather in Gomel: $description"
echo "Temperature is $temp, but feels like $temp_feels_like"