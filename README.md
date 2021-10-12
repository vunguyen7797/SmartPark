
# Smart Park - A Machine Learning Parking Application
**Create@stAte Symposium Dean's Award - College of Engineering and Computer Science 2021 - Arkansas State University**

This is a capstone senior project with the contribution from:
* Austin Smith
* Jagger Harness
* Hemil Patel
* Vu Nguyen
Mentor: Christopher Saldivar

## Problems & Inspiration
* Drivers wasting time circling around to find a vacant spot.
* Everyone might be late for work or classes if they don’t come early.
* Drivers wish to know where they will park before arriving.
* Common solutions to reduce parking lot traffic:
	* Expensive.
	* Cannot provide the location of vacant spaces.
	* Require high maintenance.
## Idea of a parking space detection system using Deep Learning
![enter image description here](https://github.com/vunguyen7797/SmartPark/blob/master/screenshots/Screen%20Shot%202021-10-12%20at%201.15.15%20AM.png?raw=true)
## System Flow

![enter image description here](https://github.com/vunguyen7797/SmartPark/blob/master/screenshots/Screen%20Shot%202021-10-12%20at%201.15.37%20AM.png?raw=true)
## How It Works
**Raspberry Pi Camera**
* Raspberry Pi 4 [1] and camera wide-view lens to deploy the model.
* Placed on a high location such as a roof of a building.
* TensorFlow Lite model installed.
	
**Web server & database**
* Backend web server was implemented as a RESTful API [4] using Node.js framework [5] with JavaScript programming language [6].
* Receiving spaces’ status data from the classifier model and store it into a database.
* Syncing data to the mobile application in real-time.
* All parking spaces’ data is stored in a relational database using SQLite3 [7].
* **Cryptography:** 
	* Cryptographic technique is to secure communication between server and machine learning model.
	* Cryptosystems use a set of procedures known as cryptographic algorithms to encrypt and decrypt messages between computer systems, smartphones,  and applications.
	* Cryptography allows the data to be signed which essentially makes it tamper-proof.
	* In this case, we utilized keys and signatures to ensure that the data being sent to the web server and database was from the unique Raspberry Pi and not an outside source.

**Parking Space Classifier**
Refer to this repo: [vunguyen7797/SmartParkingLot-Classifier: Machine Learning Classifier for Smart Park project (github.com)](https://github.com/vunguyen7797/SmartParkingLot-Classifier)

## Client Application
* Smart Park mobile application was built by Flutter framework [8] with Dart programming language [9] to run on Android [10] and iOS [11] platforms.
* Providing multiple functionalities to help parking more convenient.
* Receiving data sent from the machine learning model via web server using Web Socket to stream real-time data.

**Demo Feature**
**1. Parking Lots Near Me** 
* The app will suggest to users a list of parking lots nearest to the users’ current location.
* Device GPS location is collected to calculate the distance between the current location and parking lot location data in the database.
* Users select one parking lot to see the availability of its parking spaces.
![enter image description here](https://github.com/vunguyen7797/SmartPark/blob/master/screenshots/parking_lot_near_me.png?raw=true)

**2. List View Mode**
* Parking spaces’ availability is displayed on a list to create an intuitive user interface.
* Users can refer to see parking space real-time status.
* Users can also reserve a parking space for a certain amount of time in advantages.
![enter image description here](https://github.com/vunguyen7797/SmartPark/blob/master/screenshots/list_view_mode.png?raw=true)

**3. Map View Mode**
* Map view mode helps users locate a parking space faster with the directions and the color indicator for space status.
* Map view layout was rendered using the coordinates detected from the camera.
![enter image description here](https://github.com/vunguyen7797/SmartPark/blob/master/screenshots/mapviewmode.png?raw=true)

**4. Find My Car (future)**
Map view mode was integrated with the Find My Car feature that the user can locate their car quickly with the color indicator (Blue), using the collected parking location.
![enter image description here](https://github.com/vunguyen7797/SmartPark/blob/master/screenshots/findmycar.png?raw=true)

## References
•[1] Raspberry Pi. [https://en.wikipedia.org/wiki/Raspberry_Pi](https://en.wikipedia.org/wiki/Raspberry_Pi)

•[2] TensorFlow Lite. [https://www.tensorflow.org/lite/](https://www.tensorflow.org/lite/)

•[3] Almeida, Paulo & Soares de Oliveira, Luiz & Jr, Alceu & Jr, Eunelson & Koerich, Alessandro. (2015). PKLot - A Robust Dataset for Parking Lot Classification. Expert Systems with Applications. 42. 10.1016/j.eswa.2015.02.009.

•[4] RESTful API. [https://en.wikipedia.org/wiki/Overview_of_RESTful_API_Description_Languages](https://en.wikipedia.org/wiki/Overview_of_RESTful_API_Description_Languages)  [API Description Languages - Wikipedia](https://en.wikipedia.org/wiki/Overview_of_RESTful_API_Description_Languages)

•[5] Node.js. [https://nodejs.org/en/js](https://nodejs.org/en/)

•[6] JavaScript Programming Language. [https://en.wikipedia.org/wiki/JavaScript](https://en.wikipedia.org/wiki/JavaScript)

•[7] SQLite3. [https://www.sqlite.org/index.html](https://www.sqlite.org/index.html)

•[8] Flutter. [https://flutter.dev/](https://flutter.dev/)

•[9] Dart. [https://dart.dev/](https://dart.dev/)

•[10] Android. [https://www.android.com/](https://www.android.com/)
