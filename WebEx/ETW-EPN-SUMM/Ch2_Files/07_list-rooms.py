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


#######################################################################################
#     Ask the user to use either the hard coded token (access token within the code)
#     or for the user to input their access token.
#     Assign the hard coded or user entered access token to the variable accessToken.
#######################################################################################

# Student Step #1
#    Following this comment and using the accessToken variable below, modify the code to
#    ask the user to use either hard-coded or user-entered access token.

<!!!REPLACEME with code to ask user for the Webex Teams Access Token or use a hardcoded one!!!>
	
#########################################################################################
#  Build request components, URI and header with bearer token 
#########################################################################################

#  Student Step #2
#     Following this comment, modify the code below to use the Webex Teams room API endpoint (URL)
apiUri = "<!!!REPLACEME with URL for Webex Teams Rooms API!!!>"

##########################################################################################
# Make request and convert response JSON to Python object
##########################################################################################
#make request and store result in resp 
resp = requests.get( apiUri, 
                     headers = {"Authorization":accessToken}
                   ) 
# check if the API request executed correctly with the HTTP status code == 200
if not resp.status_code == 200:
    raise Exception("Incorrect reply from Webex Teams API. Status code: {}. Text: {}".format(resp.status_code, resp.text))

json_data = resp.json() # convert the JSON response to Python dictionary object

##########################################################################################
# Format and Output response data with string that identifies output
##########################################################################################

print("Webex Teams Response Data:") # Print identifying string
print( json.dumps(json_data, indent = 4) ) #format Python JSON data object and print


#######################################################################################
# End of program
#######################################################################################
