import mysql.connector

def add_album_data(cursor, db_connection, genre_type, album_id, release_date, chart_position, tracklist, duration, artist):

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
    cursor.execute("SELECT * FROM TourDates WHERE (%s BETWEEN start_date AND end_date OR %s BETWEEN start_date AND end_date)", (start_date, end_date))
    overlap = cursor.fetchone()
    return overlap is not None

def add_tour_dates(cursor, db_connection, tour_id, tour_name, ticket_sales, tour_city, tour_state, tour_pincode, start_date, end_date):
    try:
        if check_date_overlap(cursor, db_connection, start_date, end_date):
            print("Error: Date overlap detected. Please choose different dates.")
        else:
            cursor.execute("INSERT INTO Tours (tour_id, tour_name, ticket_sales) VALUES (%s, %s, %s)", (tour_id, tour_name, ticket_sales))
            cursor.execute("INSERT INTO TourLocations (tour_id, city, state) VALUES (%s, %s, %s)", (tour_id, tour_city, tour_state))
            cursor.execute("INSERT INTO TourAddresses (tour_id, pincode) VALUES (%s, %s)", (tour_id, tour_pincode))
            cursor.execute("INSERT INTO TourDates (tour_id, start_date, end_date) VALUES (%s, %s, %s)", (tour_id, start_date, end_date))
            db_connection.commit()
            print("Tour dates added successfully!")
    except ValueError:
        print("Error: Invalid date format or tour ID. Please follow the correct format.")

def update_chart_position(cursor, db_connection, album_id, new_chart_position):
    try:
        # Join tables to retrieve AlbumID using album name
        cursor.execute("""
            SELECT AlbumID
            FROM ChartPosition
            WHERE AlbumID = %s
        """, (album_id,))
        album_idd = cursor.fetchone()

        if album_idd:
            # Update the chart position of the specified album
            cursor.execute("""
                UPDATE ChartPosition
                SET ChartPositionNumber = %s
                WHERE AlbumID = %s
            """, (new_chart_position, album_id))  # album_id is a tuple, so use album_id[0] to get the value

            # Commit the transaction
            db_connection.commit()
            print(f"Chart position for ID '{album_id}' updated successfully!")
        else:
            print(f"Album ID '{album_id}' not found.")
    except mysql.connector.Error as e:
        db_connection.rollback()
        print(f"An error occurred: {e}")

def assign_budget_to_campaign(cursor, db_connection, campaign_name, user_budget):
    try:
        # Get the AlbumID with the highest chart position
        cursor.execute("""
            SELECT campaign_name FROM marketing_campaigns WHERE campaign_name = %s
        """, (campaign_name, ))
        here = cursor.fetchone()
        if here:
            cursor.execute("""
                UPDATE marketing_campaigns
                SET Budget=%s
                WHERE campaign_name = %s
            """, (user_budget, campaign_name))
            campaign_name = cursor.fetchone()
            db_connection.commit()
            print(f"Budget updated for campaign '{campaign_name}' to {user_budget}")
        else:
            print("No campaign found in the marketing_campaigns table.")
        
    except mysql.connector.Error as e:
        db_connection.rollback()
        print(f"An error occurred: {e}")

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
            DELETE FROM EmployeeInfo
            WHERE employee_id = %s
        """, (employee_id,))

        # Commit the transaction
        db_connection.commit()
        print(f"Employee with ID {employee_id} deleted successfully!")

    except mysql.connector.Error as e:
        db_connection.rollback()
        print(f"An error occurred: {e}")