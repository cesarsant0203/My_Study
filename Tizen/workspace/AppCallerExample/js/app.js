/*
 * Copyright (c) 2015 Samsung Electronics Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

(function() {
    /**
     * Changes the image of the icon to be displayed
     * @private
     * @param {Number} imgId - the id of the image
     */
    function changeImg(imgId) {
        var imgPath = "./image/" + imgId + ".svg";

        document.querySelector("#img-icon").setAttribute("src", imgPath);
    }

    /**
     * Launches the Callee application using the Application Control
     * @private
     */
    function launchApp() {
        var appControl = null,
            successCallback = null,
            errorCallback = null,
            appControlReplyCallback = null;

        // Define the data structure describing application control details
        appControl = new tizen.ApplicationControl(
            "http://tizen.org/appcontrol/operation/appcall",
            null,
            null,
            null);

        // Define the method to call when the invocation ends successfully
        successCallback = function() {
            console.log("launch application control succeed");
        };

        // Define the method to invoke when an error occurs
        errorCallback = function(e) {
            alert("App Callee Sample \n must be installed.");
            console.error("launch application control failed. reason: " + e.message);
        };

        // Define the method to invoke when the application gets back results from the Callee application
        appControlReplyCallback = {
            // When succeeded to get a reply from the Callee application
            onsuccess: function(data) {
                var i;

                document.querySelector("#content-reply").style.visibility = "visible";

                // Since the data passed from the Callee application is stored as an Object array , it must loop through the array
                for (i = 0; i < data.length; i++) {
                    changeImg(data[i].value[0]);
                }

            },
            // When failed to get a reply from the Callee application
            onfailure: function() {
                alert("Failed to get a reply \n from the AppCallee");
                console.error("Failed to get a reply from the AppCallee");
            }
        };

        try {
            // Launch an application with the specified application control
            tizen.application.launchAppControl(
                appControl,
                null,
                successCallback,
                errorCallback,
                appControlReplyCallback
            );
        } catch (error) {
            console.error("launchAppControl(): " + error.message);
        }
    }

    /**
     * Sets default event listeners
     * @private
     */
    function setDefaultEvents() {
        // Launch the Callee application when the Call button is clicked
        document.querySelector("#btn-call").addEventListener("click", launchApp);

        // Add eventListener for tizenhwkey
        document.addEventListener("tizenhwkey", function(e) {
            if (e.keyName === "back") {
                try {
                    tizen.application.getCurrentApplication().exit();
                } catch (error) {
                    console.error("getCurrentApplication(): " + error.message);
                }
            }
        });
    }

    /**
     * Initiates the application
     * @private
     */
    function init() {
        setDefaultEvents();
    }

    window.onload = init;
}());