#######################################################################################
# This program:
# 1. Asks the user for their access token or to use the hard coded access token
# 2. Provides the information for a list of Webex Teams rooms using the JSON format
#
# The student will:
# 1. Provide the code to prompt the user for their access token else
#    use the hard coded access token
# 2. Enter the Webex Teams room API endpoint (URL)
#######################################################################################

# Libraries

# import requests library
import requests

#import json library
import json


choice = input("Do you want to use the hard-coded token? (y/n)")

if choice == "N" or choice == "n":
	accessToken = input("Enter your access token: ")
	accessToken = "Bearer " + accessToken
else: 
	accessToken = "Bearer MjM1NTY4ZjUtNjJiMS00NmEwLWIzNDQtODBhOTU4ODQyOTZjYmIxZTVmNTUtYmY5_PF84_consumer"
	

apiUri = "https://api.ciscospark.com/v1/rooms"

##########################################################################################
# Make request and convert response JSON to Python object
##########################################################################################
resp = requests.get( apiUri, 
                     headers = {"Authorization":accessToken}
                   ) 
# check if the API request executed correctly with the HTTP status code == 200
if not resp.status_code == 200:
    raise Exception("Incorrect reply from WEBEX TEAMS API. Status code: {}. Text: {}".format(resp.status_code, resp.text))

json_data = resp.json() # convert the JSON response to Python dictionary object

##########################################################################################
# Format and Output response data with string that identifies output
##########################################################################################

print("Webex Teams Response Data:") # Print identifying string
print( json.dumps(json_data, indent = 4) ) #format Python JSON data object and print

