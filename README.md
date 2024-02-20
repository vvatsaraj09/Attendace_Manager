### Attendance Manager
Attendance Manager is a simple project designed to streamline attendance tracking for students. By leveraging location-based attendance marking, students can conveniently mark their attendance for specific subjects when they are within the designated vicinity.

#### Key Features
1) Location-based Attendance Marking: Students can mark their attendance for a particular subject when their location aligns with the designated attendance location.
2) Firebase Authentication: Utilizes Firebase authentication for secure user management, ensuring that only authorized students can mark their attendance.
3) Subject Coordination: Enables storage and coordination of attendance data with specific subjects, providing a structured approach to attendance management.

#### How It Works
1) Authentication: Students log in using their credentials via Firebase authentication.
2) Subject Selection: Upon successful authentication, students select the subject for which they wish to mark attendance.
3) Location Check: The app checks the student's current location against the designated attendance location for the selected subject.
4) Attendance Marking: If the student's location matches the designated area, their attendance for the selected subject is marked automatically.

#### Development Details
Authentication: Firebase Authentication
Database: Firebase Firestore (for storing attendance data and subject information)

#### Installation and Deployment
1) Clone the Repository: Clone the Attendance Manager repository from GitHub.
2) Set Up Firebase: Create a Firebase project and configure authentication and Firestore database as per the provided documentation.
3) Configuration: Update the Firebase configuration file with your project's credentials.
4) Build and Run: Build the project and deploy it to your preferred platform. Ensure that the necessary permissions for location access are configured on the device.
