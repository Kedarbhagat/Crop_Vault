#Deployed on AWS Lambda and integrated with AWS API Gateway.
#Example URL- https://dum52fg547.execute-api.us-east-1.amazonaws.com/v1?lat=14.2798&lon=74.4439

from flask import Flask, request, jsonify, Response
import requests
import awsgi


app = Flask(__name__)

@app.route('/', methods=['GET'])
def get_results():
    query_dict = request.args.to_dict(flat=False)
    lat = query_dict.get('lat', [None])[0]
    lon = query_dict.get('lon', [None])[0]
    print(lat)
    print(lon)

    url = f"https://open-weather13.p.rapidapi.com/city/latlon/{lat}/{lon}"

    headers = {
        "X-RapidAPI-Key": {API_KEY},
        "X-RapidAPI-Host": "open-weather13.p.rapidapi.com"
    }

    response = requests.get(url, headers=headers)
    response.raise_for_status()
    response = response.json()
    if(response["cod"] == 200):
        print(response)
        weather_condition = response["weather"][0]["description"]
        city = response["name"]
        kelvin_temp = response["main"]["temp"]
        print(kelvin_temp)
        temperature = int(kelvin_temp) - 273.15
        temperature = round(temperature, 2)
        return jsonify({"city": city, "temperature": temperature, "weather" : weather_condition}), 200
    else:
        return jsonify({"response" : "Check your URL and try again"}), 400


def lambda_handler(event, context):
    return awsgi.response(app, event, context, base64_content_types={"image/png"})
