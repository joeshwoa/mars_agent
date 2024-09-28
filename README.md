<img src="https://skillicons.dev/icons?i=flutter,dart" />
<br>

# Mars Agent
Mars Agent is a cross-platform mobile and desktop application built using Flutter. It simulates agent-based systems, specifically tailored for Mars exploration and navigation. The application utilizes the A* pathfinding algorithm, implemented in Flask from the flask-a-star-algorithm project, to allow agents to navigate and efficiently reach goals on the Martian terrain.

## Features
Cross-Platform Compatibility: Runs on both mobile (iOS, Android) and desktop (Windows, macOS, Linux) environments using Flutter.

A Algorithm Integration*: Implements A* from an external Flask service to calculate optimal paths and guide agents to their objectives.

Agent Simulation: Users can create, manage, and control agents to complete tasks such as navigating across Mars-like terrain.

Network Integration: Connects to Flask backend to fetch pathfinding results via HTTP requests.

Responsive UI: A user-friendly interface that adapts smoothly between mobile and desktop devices.

## Installation
1. Prerequisites
Flutter SDK: Install the Flutter SDK by following the official Flutter setup.

Flask Server: Clone and set up the A* algorithm backend from flask-a-star-algorithm.

### Mobile (iOS/Android)
2. Clone the Mars Agent repository: ```git clone https://github.com/joeshwoa/mars_agent.git```
3.Navigate to the project directory: ```cd mars_agent```
4. Install Flutter dependencies: ```flutter pub get```
5. Set up and run the Flask A* backend by following the instructions from flask-a-star-algorithm.
6. Run the Flutter app on your device: ```flutter run```
   
### Desktop (Windows/macOS/Linux)
2. Clone the repository: ```git clone https://github.com/joeshwoa/mars_agent.git```
3. Ensure Flutter desktop support is set up by following Flutter desktop setup.
4. Install dependencies: ```flutter pub get```
5. Ensure the Flask backend is running for A* algorithm calculations.
6. Run the desktop application: ```flutter run -d windows  # Replace with your target platform (windows, macos, linux)```
   
## Requirements
Flutter: Installed and configured for mobile and desktop development.

Backend: The Flask-based A* algorithm service must be running.

Mobile Devices: iOS/Android device or emulator.

Desktop Devices: Windows/macOS/Linux system with Flutter desktop support.

## Usage
Pathfinding: The application sends requests to the Flask A* server to compute the shortest path from an agent’s current position to the target.

Agent Control: Users can simulate and manage agents on Mars, directing them to various locations and observing real-time pathfinding decisions.

Customization: Users can configure the environment and modify the behavior of agents, terrain, and obstacles.

## Contributing
If you'd like to contribute to this project:

1. Fork the repository.
2. Create your feature branch: ```git checkout -b feature-branch```.
3. Commit your changes: ```git commit -m 'Add new feature'```.
4. Push to the branch: ```git push origin feature-branch```.
5. Open a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
