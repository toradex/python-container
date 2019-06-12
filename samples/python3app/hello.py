import requests
import geoip2.database

print("This sample will work if your device is connected to the internet.")

ip = requests.get('https://api.ipify.org').text

print("Your public IP address is:"+str(ip))

reader = geoip2.database.Reader('/GeoLite2-City.mmdb')

response = reader.city(ip)

if response is not None:
    print("You are in "+response.city.name+","+response.country.name)
else:
    print("Cannot convert your IP to a location.")
