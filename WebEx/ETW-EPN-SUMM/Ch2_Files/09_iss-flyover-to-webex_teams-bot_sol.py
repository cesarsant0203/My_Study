###############################################################
# This program:
# 1. Asks the user to enter an access token or use the hard coded access token
# 2. Lists the users in Webex Teams rooms
# 3. Asks the user which Webex Teams room to monitor for "/location" requests (e.g. /San Jose)
# 4. Periodically monitors the selected Webex Teams room for "/location" messages
# 5. Discovers GPS coordinates for the "location" using MapQuest API
# 6. Discovers the date and time of the next ISS flyover over the "location" using the ISS location API
# 7. Sends the results back to the Webex Teams room
#
# The student will:
# 1. Enter the Webex Teams room API endpoint (URL)
# 2. Provide the code to prompt the user for their access token else
#    use the hard coded access token
# 3. Provide the MapQuest API Key
# 4. Extracts the longitude from the MapQuest API response using the specific key
# 5. Convers Unix Epoch timestamp to a human readable format
# 6. Enter the Webex Teams messages API endpoint (URL)
###############################################################

# Libraries

import requests
import json
import time

#######################################################################################
#     Ask the user to use either the hard-coded token (access token within the code)
#     or for the user to input their access token.
#     Assign the hard-coded or user-entered access token to the variable accessToken.
#######################################################################################

# Student Step #2
#    Following this comment and using the accessToken variable below, modify the code to
#    ask the user to use either hard-coded or user-entered access token.
choice = input("Do you wish to use the hard-coded token? (y/n)")

if choice == "N" or choice == "n":
	accessToken = input("What is your access token? ")
	accessToken = "Bearer " + accessToken
else:
	accessToken = "Bearer <!!!REPLACEME with hardcoded access token value!!!>"

#######################################################################################
#     Using the requests library, create a new HTTP GET Request against the Webex Teams API Endpoint for Webex Teams Rooms:
#     the local object "r" will hold the returned data.
#######################################################################################

#  Student Step #3
#     Modify the code below to use the Webex Teams room API endpoint (URL)
r = requests.get(   "https://api.ciscospark.com/v1/rooms",
                    headers = {"Authorization": accessToken}
                )
#######################################################################################
# Check if the response from the API call was OK (r. code 200)
#######################################################################################
if not r.status_code == 200:
    raise Exception("Incorrect reply from Webex Teams API. Status code: {}. Text: {}".format(r.status_code, r.text))


#######################################################################################
# Displays a list of rooms.
#
# If you want to see additional key/value pairs such as roomID:
#	print ("Room name: '" + room["title"] + "' room ID: " + room["id"])
#######################################################################################
print("List of rooms:")
rooms = r.json()["items"]
for room in rooms:
    print (room["title"])

#######################################################################################
# Searches for name of the room and displays the room
#######################################################################################

while True:
    # Input the name of the room to be searched 
    roomNameToSearch = input("Which room should be monitored for /location (e.g. /San Jose) messages? ")

    # Defines a variable that will hold the roomId 
    roomIdToGetMessages = None
    
    for room in rooms:
        # Searches for the room "title" using the variable roomNameToSearch 
        if(room["title"].find(roomNameToSearch) != -1):

            # Displays the rooms found using the variable roomNameToSearch (additional options included)
            print ("Found rooms with the word " + roomNameToSearch)
            print(room["title"])

            # Stores room id and room title into variables
            roomIdToGetMessages = room["id"]
            roomTitleToGetMessages = room["title"]
            print("Found room : " + roomTitleToGetMessages)
            break

    if(roomIdToGetMessages == None):
        print("Sorry, I didn't find any room with " + roomNameToSearch + " in it.")
        print("Please try again...")
    else:
        break


# run the "bot" loop until manually stopped or an exception occurred
while True:
    # always add 1 second of delay to the loop to not go over a rate limit of API calls
    time.sleep(1)

    # the Webex Teams GET parameters
    #  "roomId" is is ID of the selected room
    #  "max": 1  limits to get only the very last message in the room
    GetParameters = {
                            "roomId": roomIdToGetMessages,
                            "max": 1
                         }
    # run the call against the messages endpoint of the Webex Teams API using the HTTP GET method
    r = requests.get("https://api.ciscospark.com/v1/messages", 
                         params = GetParameters, 
                         headers = {"Authorization": accessToken}
                    )
    # verify if the retuned HTTP status code is 200/OK
    if not r.status_code == 200:
        raise Exception( "Incorrect reply from Webex Teams API. Status code: {}. Text: {}".format(r.status_code, r.text))
    
    # get the JSON formatted returned data
    json_data = r.json()
    # check if there are any messages in the "items" array
    if len(json_data["items"]) == 0:
        raise Exception("There are no messages in the room.")
    
    # store the array of messages
    messages = json_data["items"]
    # store the text of the first message in the array
    message = messages[0]["text"]
    print("Received message: " + message)
    
    # check if the text of the message starts with the magic character "/" followed by a location name
    #  e.g.  "/San Jose"
    if message.find("/") == 0:
        # name of a location (city) where we check for GPS coordinates using the MapQuest API
        #  message[1:]  returns all letters of the message variable except the first "/" character
        #   "/San Jose" is turned to "San Jose" and stored in the location variable
        location = message[1:]
        
        #  Student Step #4
        #     Add the MapQuest API key (from Chapter 1)
        # the MapQuest API GET parameters
        #  "location" is the the location to lookup
        #  "key" is the secret API KEY you generated at https://developer.mapquest.com/user/me/apps
        mapsAPIGetParameters = { 
                                "location": location, 
                                "key": "<!!!REPLACEME with your MapQuest API Key!!!>" # please enter your MapQuest API key here
                               }
        # Get location information using the MapQuest API geocode service using the HTTP GET method
        r = requests.get("https://www.mapquestapi.com/geocoding/v1/address?", 
                             params = mapsAPIGetParameters
                        )
        # Verify if the returned JSON data from the MapQuest API service are OK
        json_data = r.json()
        # check if the status key in the returned JSON data is "0"
        if not json_data["info"]["statuscode"] == 0:
            raise Exception("Incorrect reply from MapQuest API. Status code: {}".format(r.statuscode))

        # store the location received from the MapQuest API in a variable
        locationResults = json_data["results"][0]["providedLocation"]["location"]
        # print the location address
        print("Location: " + locationResults)

        #  Student Step #5
        #     Set the latitude and longitude key as retuned by the MapQuest API
        # store the GPS latitude and longitude of the location as received from the MapQuest API in variables
        locationLat = json_data["results"][0]["locations"][0]["latLng"]["lat"]
        locationLng = json_data["results"][0]["locations"][0]["latLng"]["lng"]
        # print the location address
        print("Location GPS coordinates: " + str(locationLat) + ", " + str(locationLng))
        
        # documentation of the ISS flyover API: http://open-notify-api.readthedocs.io/en/latest/iss_pass.html
        # the ISS flyover API GET parameters
        #  "lat" is the Latitude of the location
        #  "lon" is the longitude of the location
        issAPIGetParameters = { 
                                "lat": locationLat, 
                                "lon": locationLng
                              }
        # Get IIS flyover information over the specified GPS coordinates using the HTTP GET method
        r = requests.get("http://api.open-notify.org/iss-pass.json", 
                             params = issAPIGetParameters
                        )
        # get the json formatted retuned data
        json_data = r.json()
        # Verify if the returned JSON data from the API service are OK and contains the "response" key
        if not "response" in json_data:
            raise Exception("Incorrect reply from open-notify.org API. Status code: {}. Text: {}".format(r.status_code, r.text))

        # store the risetime and duration of the first flyover in a variable
        risetimeInEpochSeconds = json_data["response"][0]["risetime"]
        durationInSeconds      = json_data["response"][0]["duration"]

        #  Student Step #6
        #     Use the time.????? function to convert the risetime in Epoch timestamp to human readable time
        # convert the risetime returned by the API service in Unix Epoch time
        # to a human readable date and time
        risetimeInFormattedString = str(time.ctime(risetimeInEpochSeconds))

        # assemble the response message
        responseMessage = "In {} the ISS will fly over on {} for {} seconds.".format(locationResults, risetimeInFormattedString, durationInSeconds)
        # print the response message
        print("Sending to Webex Teams: " +responseMessage)
        
        
        # the Webex Teams HTTP headers, including the Content-Type header for the POST JSON data
        HTTPHeaders = { 
                             "Authorization": accessToken,
                             "Content-Type": "application/json"
                           }
        # the Webex Teams POST JSON data
        #  "roomId" is is ID of the selected room
        #  "text": is the responseMessage assembled above
        PostData = {
                            "roomId": roomIdToGetMessages,
                            "text": responseMessage
                        }
        # run the call against the messages endpoint of the Webex Teams API using the HTTP POST method
        #  Student Step #7
        #     Modify the code below to use the Webex Teams messages API endpoint (URL)
        r = requests.post( "https://api.ciscospark.com/v1/messages", 
                              data = json.dumps(PostData), 
                              headers = HTTPHeaders
                         )
        if not r.status_code == 200:
            raise Exception("Incorrect reply from Webex Teams API. Status code: {}. Text: {}".format(r.status_code, r.text))


    
