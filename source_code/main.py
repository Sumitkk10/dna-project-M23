import pymysql

# Database connection parameters
db_config = {
    'host': 'localhost',
    'user': 'your_username',
    'password': 'your_password',
    'database': 'your_database_name',
    'port': 3306,
}

# Function to create the database and tables
def create_database_and_tables(connection):
    try:
        with connection.cursor() as cursor:
            # Create database
            cursor.execute("CREATE DATABASE IF NOT EXISTS your_database_name")
            cursor.execute("USE your_database_name")

            # Create Employees table (Superclass)
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS Employees (
                    employee_id INT PRIMARY KEY,
                    employee_name VARCHAR(255),
                    phone_number BIGINT,
                    joining_date DATE,
                    date_of_birth DATE,
                    salary INT
                )
            """)

            # Create Designers table (Subclass)
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS Designers (
                    designer_id INT PRIMARY KEY,
                    employee_id INT,
                    covers_designed INT,
                    total_revenue INT,
                    artistic_style VARCHAR(255),
                    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
                )
            """)

            # Create Producers table (Subclass)
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS Producers (
                    producer_id INT PRIMARY KEY,
                    employee_id INT,
                    artists_handled VARCHAR(255),
                    production_credits VARCHAR(255),
                    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
                )
            """)

            # Create Marketers table (Subclass)
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS Marketers (
                    marketer_id INT PRIMARY KEY,
                    employee_id INT,
                    artists_handled VARCHAR(255),
                    campaigns_involved INT,
                    advertising_budget INT,
                    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
                )
            """)

            # Create SongWriters table (Subclass)
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS SongWriters (
                    writer_id INT PRIMARY KEY,
                    employee_id INT,
                    song_catalog VARCHAR(255),
                    royalties_earned INT,
                    genre_expertise VARCHAR(255),
                    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
                )
            """)

            # Create Managers table (Subclass)
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS Managers (
                    manager_id INT PRIMARY KEY,
                    employee_id INT,
                    artist_roster VARCHAR(255),
                    tour_event_management VARCHAR(255),
                    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
                )
            """)

            # Create ARPersonnel table (Subclass)
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS ARPersonnel (
                    ar_id INT PRIMARY KEY,
                    employee_id INT,
                    new_artists_signed INT,
                    success_rate FLOAT,
                    industry_connections VARCHAR(255),
                    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
                )
            """)

        connection.commit()
        print("Database and tables created successfully.")
    except pymysql.MySQLError as e:
        print(f"Error: {e}")

# Function to populate tables with sample data
def populate_tables(connection):
    try:
        with connection.cursor() as cursor:
            # Insert sample data into Employees table (Superclass)
            cursor.executemany("""
                INSERT INTO Employees VALUES (%s, %s, %s, %s, %s, %s)
            """, [
                (101, 'Employee1', 1234567890, '2022-01-01', '1990-01-01', 50000),
                (102, 'Employee2', 9876543210, '2022-02-01', '1985-02-15', 60000),
                (103, 'Employee3', 8765432109, '2022-03-01', '1995-03-20', 55000),
                (104, 'Employee4', 7654321098, '2022-04-01', '1988-04-25', 70000),
                (105, 'Employee5', 6543210987, '2022-05-01', '1992-05-30', 65000)
            ])

            # Insert sample data into Designers table (Subclass)
            cursor.executemany("""
                INSERT INTO Designers VALUES (%s, %s, %s, %s, %s)
            """, [
                (201, 101, 10, 50000, 'Abstract'),
                (202, 102, 8, 40000, 'Minimalist'),
                (203, 103, 12, 60000, 'Pop Art'),
                (204, 104, 15, 75000, 'Realism'),
                (205, 105, 7, 35000, 'Surrealism')
            ])

            # Insert sample data into Producers table (Subclass)
            cursor.executemany("""
                INSERT INTO Producers VALUES (%s, %s, %s, %s)
            """, [
                (301, 101, 'Artist1, Artist2', 'Album1, Album2'),
                (302, 102, 'Artist3, Artist4', 'Album3, Album4'),
                (303, 103, 'Artist5, Artist6', 'Album5, Album6'),
                (304, 104, 'Artist7, Artist8', 'Album7, Album8'),
                (305, 105, 'Artist9, Artist10', 'Album9, Album10')
            ])

            # Insert sample data into Marketers table (Subclass)
            cursor.executemany("""
                INSERT INTO Marketers VALUES (%s, %s, %s, %s, %s)
            """, [
                (401, 101, 'Artist1, Artist2', 3, 20000),
                (402, 102, 'Artist3, Artist4', 2, 15000),
                (403, 103, 'Artist5, Artist6', 4, 25000),
                (404, 104, 'Artist7, Artist8', 5, 30000),
                (405, 105, 'Artist9, Artist10', 3, 18000)
            ])

            # Insert sample data into SongWriters table (Subclass)
            cursor.executemany("""
                INSERT INTO SongWriters VALUES (%s, %s, %s, %s, %s)
            """, [
                (501, 101, 'Song1, Song2', 40000, 'Pop, Rock'),
                (502, 102, 'Song3, Song4', 35000, 'R&B, Hip Hop'),
                (503, 103, 'Song5, Song6', 45000, 'Country, Folk'),
                (504, 104, 'Song7, Song8', 55000, 'Electronic, Indie'),
                (505, 105, 'Song9, Song10', 30000, 'Jazz, Blues')
            ])

            # Insert sample data into Managers table (Subclass)
            cursor.executemany("""
                INSERT INTO Managers VALUES (%s, %s, %s, %s)
            """, [
                (601, 101, '101, 102, 103', 'Tour1, Event1'),
                (602, 102, '104, 105', 'Tour2, Event2'),
                (603, 103, '101, 102', 'Tour3, Event3'),
                (604, 104, '103, 104, 105', 'Tour4, Event4'),
                (605, 105, '105', 'Tour5, Event5')
            ])

            # Insert sample data into ARPersonnel table (Subclass)
            cursor.executemany("""
                INSERT INTO ARPersonnel VALUES (%s, %s, %s, %s)
            """, [
                (701, 101, 5, 0.8, 'Connections1, Connections2'),
                (702, 102, 3, 0.7, 'Connections3, Connections4'),
                (703, 103, 4, 0.9, 'Connections5, Connections6'),
                (704, 104, 6, 0.85, 'Connections7, Connections8'),
                (705, 105, 4, 0.75, 'Connections9, Connections10')
            ])

        connection.commit()
        print("Data populated successfully.")
    except pymysql.MySQLError as e:
        print(f"Error: {e}")

# Function to display menu and handle user input
def display_menu():
    print("1. View Employees")
    print("2. View Designers")
    print("3. View Producers")
    print("4. View Marketers")
    print("5. View SongWriters")
    print("6. View Managers")
    print("7. View ARPersonnel")
    print("8. Exit")

    choice = input("Enter your choice: ")
    return choice

# Function to view employees
def view_employees(connection):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Employees")
        employees = cursor.fetchall()
        for employee in employees:
            print(employee)

# Function to view designers
def view_designers(connection):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Designers")
        designers = cursor.fetchall()
        for designer in designers:
            print(designer)

# Function to view producers
def view_producers(connection):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Producers")
        producers = cursor.fetchall()
        for producer in producers:
            print(producer)

# Function to view marketers
def view_marketers(connection):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Marketers")
        marketers = cursor.fetchall()
        for marketer in marketers:
            print(marketer)

# Function to view songwriters
def view_songwriters(connection):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM SongWriters")
        songwriters = cursor.fetchall()
        for songwriter in songwriters:
            print(songwriter)

# Function to view managers
def view_managers(connection):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Managers")
        managers = cursor.fetchall()
        for manager in managers:
            print(manager)

# Function to view AR personnel
def view_arpersonnel(connection):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM ARPersonnel")
        arpersonnel = cursor.fetchall()
        for ar in arpersonnel:
            print(ar)

# Main function
def main():
    try:
        # Establish database connection
        connection = pymysql.connect(**db_config)

        # Create database and tables
        create_database_and_tables(connection)

        # Populate tables with sample data
        populate_tables(connection)

        while True:
            choice = display_menu()

            if choice == '1':
                view_employees(connection)
            elif choice == '2':
                view_designers(connection)
            elif choice == '3':
                view_producers(connection)
            elif choice == '4':
                view_marketers(connection)
            elif choice == '5':
                view_songwriters(connection)
            elif choice == '6':
                view_managers(connection)
            elif choice == '7':
                view_arpersonnel(connection)
            elif choice == '8':
                break
            else:
                print("Invalid choice. Please try again.")

    finally:
        # Close the database connection
        connection.close()

if __name__ == "__main__":
    main()
