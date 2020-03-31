# MarvelChallenge
Challenge for Openbank

## Description

- This project is basically a list of Marvel characters which displays a bit of information about all of them.

- The initial view is an alphabetical index so when the user selects a letter the app shows a list of characters starting with the selected letter. There is a character which first letter is 3 so I also added this number to the list.

- The list of characters starting by the selected letter doesn't show all the caracters at the same time but using pagination loading and showing 20 characters more while the user scrolls down. The first load shows a spinner to let the user know that the app is loading data. 

- When a character is selected appears the view that shows more detailed information about the selected character. Meanwhile the data is loaded appears the loading view. This view shows the name of the character and an image and description if they are available. Here will appear in a list all the comics, stories, events and series where appear the selected character. In the information also appear some URL's with information about the character and if the user touches in any of them will appear a web browser showing the selected page.


## Features

- The application has **multilanguage support** but for now are only supported english and spanish languages.

- The development pattern used is **MVP** in order to have separated the data logic (in the Presenter) and how this data is displayed (View controllers acting just as a View). The data Models are also on their own files as structs. With this pattern is improved the separation of concerns and is easier make unit testing. 

- The colors used in each component are the colors by default so the project will automatically adapt to the style the user has on his device (**normal and dark mode**).

- In the calls to the API the parameters have to include a hash encrypted with the algorythm md5. This algorythm was broken so is insecure, this is the reason of the only warning that appears in the project.


### External libraries

The only external libraries used are **Alamofire** for the API calls and **AlamofireImage** to download and show the images. The less external libraries used, the better for not depending of their maintenance because in any moment they can be discontinued.

### Architecture for API calls

There are only two different API calls, one for get a list of characters (in this case the ones that start with the selected letter) and other for get the detail of a selected character. In the first one should be only the most important data of each character to make the request ligher, but the call returns all the information of all the characters in the result. With this, the second API call could be not necessary but I use it according to the description of the task.

There are three classes used in the logic of API calls:

##### APIManager
* This class creates the final URL and the dictionary of parameters for each call. 
* Returns via callback the data parsed to the Presenter that started the request

##### ResponseParserManager
* Intermediate class that parses the response received from ConnectionManager into our custom classes and send this data to APIManager via callback

##### ConnectionManager
* This class runs the final request and returns the response via callback to ResponseParserManager

