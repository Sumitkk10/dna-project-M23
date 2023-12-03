import mysql.connector

# Function to insert album data
def add_album_data(cursor, db_connection, genre_type, album_id, release_date, chart_position, tracklist, duration):

    # Insert into Album table
    album_insert_query = "INSERT INTO Album (AlbumID, ReleaseDate) VALUES (%s, %s)"
    album_values = (album_id, release_date)
    cursor.execute(album_insert_query, album_values)
    db_connection.commit()

    # Insert into ChartPosition table
    chart_insert_query = "INSERT INTO ChartPosition (AlbumID, ChartPositionNumber) VALUES (%s, %s)"
    chart_values = (album_id, chart_position)
    cursor.execute(chart_insert_query, chart_values)
    db_connection.commit()

    # Insert into Genre table
    genre_insert_query = "INSERT INTO Genre (AlbumID, GenreType) VALUES (%s, %s)"
    genre_values = (album_id, genre_type)
    cursor.execute(genre_insert_query, genre_values)
    db_connection.commit()

    # Insert into Album_Tracklist table
    # tracklist = input("Enter Tracklist (comma-separated): ")
    # duration = int(input("Enter Duration: "))
    tracklist_insert_query = "INSERT INTO Album_Tracklist (AlbumID, TrackList, Duration) VALUES (%s, %s, %s)"
    tracklist_values = (album_id, tracklist, duration)
    cursor.execute(tracklist_insert_query, tracklist_values)
    db_connection.commit()

    print("Album data added successfully!")



def check_date_overlap(cursor, db_connection, start_date, end_date):
    cursor.execute("SELECT * FROM tourdates WHERE ((? BETWEEN start_date AND end_date) OR (? BETWEEN start_date AND end_date))", (start_date, end_date))
    overlap = cursor.fetchone()
    return overlap is not None

# Function to add tour dates
def add_tour_dates(cursor, db_connection, tour_id, start_date, end_date):
    try:
        # tour_id = int(input("Enter Tour ID: "))
        # start_date = input("Enter Start Date (YYYY-MM-DD): ")
        # end_date = input("Enter End Date (YYYY-MM-DD): ")

        # Check if dates are valid
        start_date = datetime.strptime(start_date, '%Y-%m-%d').date()
        end_date = datetime.strptime(end_date, '%Y-%m-%d').date()

        # Check for date overlap
        if check_date_overlap(start_date, end_date):
            print("Error: Date overlap detected. Please choose different dates.")
        else:
            # Add tour dates to the database
            cursor.execute("INSERT INTO tourdates (tourid, start_date, end_date) VALUES (?, ?, ?)", (tour_id, start_date, end_date))
            db_connection.commit()
            print("Tour dates added successfully!")
    except ValueError:
        print("Error: Invalid date format or tour ID. Please follow the correct format.")



###################################


##update###########################

def update_chart_position(cursor, db_connection, album_name, new_chart_position):
    try:
        # Join tables to retrieve AlbumID using album name
        cursor.execute("""
            SELECT Album.AlbumID
            FROM Album
            INNER JOIN AlbumName ON Album.CoverID = AlbumName.CoverID
            WHERE AlbumName.AlbumName = %s
        """, (album_name,))
        album_id = cursor.fetchone()

        if album_id:
            # Update the chart position of the specified album
            cursor.execute("""
                UPDATE ChartPosition
                SET ChartPositionNumber = %s
                WHERE AlbumID = %s
            """, (new_chart_position, album_id[0]))  # album_id is a tuple, so use album_id[0] to get the value

            # Commit the transaction
            db_connection.commit()
            print(f"Chart position for '{album_name}' updated successfully!")
        else:
            print(f"Album '{album_name}' not found.")
    except mysql.connector.Error as e:
        db_connection.rollback()
        print(f"An error occurred: {e}")

def assign_budget_to_campaign(cursor, db_connection, user_budget):
    try:
        # Get the AlbumID with the highest chart position
        cursor.execute("""
            SELECT AlbumID
            FROM ChartPosition
            ORDER BY ChartPositionNumber DESC
            LIMIT 1
        """)
        highest_chart_album_id = cursor.fetchone()

        if highest_chart_album_id:
            highest_chart_album_id = highest_chart_album_id[0]

            # Find the corresponding campaign linked to the highest-charted album
            cursor.execute("""
                SELECT campaign_name
                FROM marketing_campaigns
                WHERE AlbumID = %s
            """, (highest_chart_album_id,))
            campaign_name = cursor.fetchone()

            if campaign_name:
                # Update the budget of the corresponding campaign with user input
                cursor.execute("""
                    UPDATE marketing_campaigns
                    SET Budget = %s
                    WHERE campaign_name = %s
                """, (user_budget, campaign_name[0]))
                db_connection.commit()
                print(f"Budget updated for campaign '{campaign_name[0]}' to {user_budget}")
            else:
                print("No campaign found for the highest charted album.")
        else:
            print("No album found in the ChartPosition table.")
    except mysql.connector.Error as e:
        db_connection.rollback()
        print(f"An error occurred: {e}")

###################################

##delete###########################

def delete_artist(cursor, db_connection, artist_id):
    try:
        # Delete the record of the specified artist
        cursor.execute("""
            DELETE FROM Artists
            WHERE artist_id = %s
        """, (artist_id,))

        # Commit the transaction
        db_connection.commit()
        print(f"Record for artist_id {artist_id} deleted successfully!")
    except mysql.connector.Error as e:
        db_connection.rollback()
        print(f"An error occurred: {e}")

def delete_employee(cursor, db_connection, employee_id):
    try:
        # Delete the record of the specified employee
        cursor.execute("""
            DELETE FROM Employee
            WHERE EmployeeID = %s
        """, (employee_id,))

        # Commit the transaction
        db_connection.commit()
        print(f"Employee with ID {employee_id} deleted successfully!")
    except mysql.connector.Error as e:
        db_connection.rollback()
        print(f"An error occurred: {e}")

###projection###########################

##aggregate#######################




##################################

##search#######################

def check_artist_name(cursor, db_connection, user_input):
    try:
        # SQL query to retrieve all records from the Artists table
        query = "SELECT artist_name FROM Artists"

        # Execute the query
        cursor.execute(query)

        # Fetch all the results
        artist_records = cursor.fetchall()

        # Iterate through each record and check for the user input in the artist_name field
        for record in artist_records:
            artist_name = record[0]
            if user_input in artist_name:
                print(f"'{user_input}' exists in artist name: {artist_name}")
            else:
                print(f"'{user_input}' does not exist in artist name: {artist_name}")
    except mysql.connector.Error as e:
        print(f"An error occurred: {e}")
 

#################################


##functional requirements########

def get_high_grossing_collaboration(cursor, db_connection):
    try:
        # SQL query to find the highest grossing album's artist and associated producer
        query = """
            SELECT ar.artist_name AS Artist, pr.producer_id, pr.employee_id, pr.total_revenue AS Producer_Revenue
            FROM Album a
            JOIN Artists ar ON a.album_id = ar.album_id
            JOIN Producers pr ON ar.producer_id = pr.producer_id
            WHERE a.total_revenue = (SELECT MAX(total_revenue) FROM Album)
        """

        # Execute the query
        cursor.execute(query)

        # Fetch the result
        highest_grossing_collab = cursor.fetchall()

        # Display the result
        if highest_grossing_collab:
            print("Highest Selling Album's Artist and Associated Producer:")
            for record in highest_grossing_collab:
                print(record)  # Adjust printing format as needed

        else:
            print("No records found.")
    except mysql.connector.Error as e:
        print(f"An error occurred: {e}")

def average_chart_position(cursor, db_connection):
    try:
        # SQL query to calculate average chart position per artist
        query = """
            SELECT
                ar.artist_id,
                ar.artist_name,
                AVG(cp.ChartPositionNumber) AS AverageChartPosition
            FROM
                Artists ar
            JOIN
                Album al ON ar.album_id = al.album_id
            JOIN
                ChartPosition cp ON al.AlbumID = cp.AlbumID
            GROUP BY
                ar.artist_id,
                ar.artist_name
        """

        # Execute the query
        cursor.execute(query)

        # Fetch all the results
        average_positions = cursor.fetchall()

        # Display the results
        for position in average_positions:
            print(f"Artist ID: {position[0]}, Artist Name: {position[1]}, Average Chart Position: {position[2]}")

    except mysql.connector.Error as e:
        print(f"An error occurred: {e}")
