The RPi controlled by this operating system will not automatically connect to a wireless network without certain information located in the chestnut.txt file.

Follow the directions below to connect your RPi at boot:

In the mounted µSD card partition (with FAT file system and 1 GB in size), create or modify a text file called chestnut.txt with the following contents:

Device_Name="{YOUR-NETACAD-USERNAME}-{YOUR-RPi-DEVICE-NAME}"
Device_Password="{YOUR-PL-App-PASSWORD}"
SSID="{YOUR-WIFI-SSID}"
Wifi_Password="{YOUR-WIFI-PASSWORD}"

For Example:

Device_Name="myNetAcadUsername-myRPi1"
Device_Password="this is my device password"
SSID="ClassroomWIFI"
Wifi_Password="WPA2password"

The double quotes are required.
