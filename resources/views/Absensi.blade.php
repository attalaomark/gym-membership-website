<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Attendance & Schedule | Your Gym Name</title>
    <link rel="stylesheet" href="Text-Absensi.css">
    <link rel="stylesheet" href="Absensi.css">
</head>
<body>
    <div class="container">
        <h1>Gym Attendance & Schedule</h1>

        <!-- Tombol Back -->
        <div class="back-button">
        <button onclick="window.location.href='Profile'">Back</button>
        </div>

        <div class="attendance-form">
            <h2>Check In</h2>
            <form id="attendanceForm">
                <div class="form-group">
                    <label for="memberName">Member Name:</label>
                    <input type="text" id="memberName" name="memberName" required>
                </div>
                <div class="form-group">
                    <label for="checkInTime">Check-in Time:</label>
                    <input type="datetime-local" id="checkInTime" name="checkInTime" required>
                </div>
                <div class="form-group">
                    <label for="classType">Class Type:</label>
                    <select id="classType" name="classType" required>
                        <option value="">Select class type</option>
                        <option value="Cardio">Cardio</option>
                        <option value="Power Fitness">Power Fitness</option>
                        <option value="Yoga Section">Yoga Section</option>
                        <option value="Boxing">Boxing</option>
                        <option value="Aerobic">Aerobic</option>
                        <option value="Body Work">Body Work</option>
                        <option value="Power Lifting">Power Lifting</option>
                        <option value="Crossfit">Crossfit</option>
                    </select>
                </div>
                <button type="submit">Check In</button>
            </form>
        </div>

      
        <div class="schedule-table">
            <h2>Weekly GYM Schedule</h2>
            <table>
                <thead>
                    <tr>
                        <th></th>
                        <th>MON</th>
                        <th>TUE</th>
                        <th>WED</th>
                        <th>THU</th>
                        <th>FRI</th>
                        <th>SAT</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>7:00 AM</th>
                        <td>Cardio<br>7:00 AM - 9:00 AM</td>
                        <td>Power Fitness<br>7:00 AM - 9:00 AM</td>
                        <td></td>
                        <td></td>
                        <td>Yoga Section<br>7:00 AM - 9:00 AM</td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>9:00 AM</th>
                        <td></td>
                        <td></td>
                        <td>Boxing<br>8:00 AM - 9:00 AM</td>
                        <td>Aerobic<br>8:00 AM - 9:00 AM</td>
                        <td></td>
                        <td>Cardio<br>8:00 AM - 9:00 AM</td>
                    </tr>
                    <tr>
                        <th>11:00 AM</th>
                        <td></td>
                        <td>Boxing<br>11:00 AM - 2:00 PM</td>
                        <td>Aerobic<br>11:30 AM - 3:30 PM</td>
                        <td></td>
                        <td>Body Work<br>11:50 AM - 5:20 PM</td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>2:00 PM</th>
                        <td>Boxing<br>2:00 PM - 4:00 PM</td>
                        <td>Power Lifting<br>3:00 PM - 6:00 PM</td>
                        <td></td>
                        <td>Cardio<br>6:00 PM - 9:00 PM</td>
                        <td></td>
                        <td>Crossfit<br>5:00 PM - 7:00 PM</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>


    <script>
        document.getElementById('attendanceForm').addEventListener('submit', function(e) {
            e.preventDefault();
            alert("Check-in berhasil!"); // Tambah notifikasi atau simpan di database
            this.reset();
        });
    </script>
</body>
</html>