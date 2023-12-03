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

def add_tour_dates(cursor, db_connection, tour_id, start_date, end_date):
    try:
        if check_date_overlap(cursor, db_connection, start_date, end_date):
            print("Error: Date overlap detected. Please choose different dates.")
        else:
            cursor.execute("INSERT INTO TourDates (tour_id, start_date, end_date) VALUES (%s, %s, %s)", (tour_id, start_date, end_date))
            db_connection.commit()
            print("Tour dates added successfully!")
    except ValueError:
        print("Error: Invalid date format or tour ID. Please follow the correct format.")
