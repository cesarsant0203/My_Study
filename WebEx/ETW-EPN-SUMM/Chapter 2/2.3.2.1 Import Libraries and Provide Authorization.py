import requests
import json
import time

choice = input("Do you wish to use the hard coded token? (y/n)")

if choice == "N" or choice == "n":
	accessToken = input("Enter your access token: ")
	accessToken = "Bearer " + accessToken
else: 
	accessToken = "Bearer Mzg0YzViYWYtODc2OC00MjA2LWJlODgtMzM5NmM1OWVmZjIwYTAyMGYzMGUtYTVl_PF84_consumer"