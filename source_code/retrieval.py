import mysql.connector

def artists_released_past_year(cursor, db_connection):
    try:
        # SQL query to retrieve artists who released albums in the past year
        query = """
            SELECT DISTINCT a.artist_name
            FROM Artists a
            INNER JOIN Album al ON a.album_id = al.AlbumID
            WHERE al.ReleaseDate >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
        """

        # Execute the query
        cursor.execute(query)

        # Fetch all the results
        artists = cursor.fetchall()

        # Display the artists
        if artists:
            print("Artists who released albums in the past year:")
            for artist in artists:
                print(artist[0])  # Assuming artist_name is the first column

        else:
            print("No artists found who released albums in the past year.")
    except mysql.connector.Error as e:
        print(f"An error occurred: {e}")

def get_artists_by_producer(cursor, db_connection, producer_id):
    try:
        # SQL query to retrieve artists associated with a specific producer
        query = f"""
            SELECT DISTINCT a.artist_name
            FROM Artists a
            WHERE a.producer_id = {producer_id}
        """

        # Execute the query
        cursor.execute(query)

        # Fetch all the results
        artists = cursor.fetchall()

        # Display the artists
        if artists:
            print(f"Artists working with Producer ID {producer_id}:")
            for artist in artists:
                print(artist[0])  # Assuming artist_name is the first column

        else:
            print(f"No artists found working with Producer ID {producer_id}.")
    except mysql.connector.Error as e:
        print(f"An error occurred: {e}")

# Album doesn't have an attribute called coverID.
def get_album_names_by_genre(cursor, db_connection, genre):
    try:
        # SQL query to retrieve album names based on genre
        query = f"""
            SELECT an.AlbumName
            FROM Genre g
            INNER JOIN Album a ON g.AlbumID = a.AlbumID
            INNER JOIN AlbumName an ON a.CoverID = an.CoverID
            WHERE g.GenreType = '{genre}'
        """

        # Execute the query
        cursor.execute(query)

        # Fetch all the results
        album_names = cursor.fetchall()

        # Display the album names
        if album_names:
            print(f"Albums with genre '{genre}':")
            for album_name in album_names:
                print(album_name[0])  # Assuming AlbumName is the first column

        else:
            print(f"No albums found with genre '{genre}'.")
    except mysql.connector.Error as e:
        print(f"An error occurred: {e}")

def get_tours_by_location(cursor, db_connection, city, state):
    try:
        # SQL query to retrieve tour names based on city and state
        query = f"""
            SELECT t.tour_name
            FROM Tours t
            INNER JOIN TourLocations tl ON t.tour_id = tl.tour_id
            WHERE tl.city = '{city}' AND tl.state = '{state}'
        """

        # Execute the query
        cursor.execute(query)

        # Fetch all the results
        tours = cursor.fetchall()

        # Display the tour names
        if tours:
            print(f"Tours in {city}, {state}:")
            for tour in tours:
                print(tour[0])  # Assuming tour_name is the first column

        else:
            print(f"No tours found in {city}, {state}.")
    except mysql.connector.Error as e:
        print(f"An error occurred: {e}")

def total_released_albums(cursor, db_connection):
    try:
        # SQL query to calculate the total count of released albums
        query = "SELECT SUM(num_released_albums) AS TotalReleasedAlbums FROM Artists"

        # Execute the query
        cursor.execute(query)

        # Fetch the result
        total_albums = cursor.fetchone()

        # Display the total count of released albums
        if total_albums:
            print(f"Total released albums by the entire ensemble: {total_albums[0]}")
        else:
            print("No albums released by the ensemble.")
    except mysql.connector.Error as e:
        print(f"An error occurred: {e}")

def artist_with_min_albums(cursor, db_connection):
    try:
        # SQL query to find the artist with the least number of albums released
        query = query = "SELECT artist_name, MIN(num_released_albums) AS MinReleasedAlbums FROM Artists GROUP BY artist_name"

        # Execute the query
        cursor.execute(query)

        # Fetch the result
        min_albums_artist = cursor.fetchone()

        # Display the artist with the least number of albums released
        if min_albums_artist:
            print(f"Artist with the least albums released: {min_albums_artist[0]} "
                  f"({min_albums_artist[1]} albums)")
        else:
            print("No information available about the artists.")

    except mysql.connector.Error as e:
        print(f"An error occurred: {e}")

def check_artist_name(cursor, db_connection, user_input):
    try:
        # SQL query to retrieve all records from the Artists table
        query = "SELECT artist_name FROM Artists"

        # Execute the query
        cursor.execute(query)

        # Fetch all the results
        artist_records = cursor.fetchall()

        # Iterate through each record and check for the user input in the artist_name field
        ok = 0
        for record in artist_records:
            artist_name = record[0]
            if user_input in artist_name:
                print(f"'{user_input}' exists in artist name: {artist_name}")
                ok = 1
        if(ok == 0):
            print(f"'{user_input}' does not exist in artists")
        
    except mysql.connector.Error as e:
        print(f"An error occurred: {e}")
        
def check_album_name(cursor, db_connection, user_input):
    try:
        # SQL query to retrieve all records from the Artists table
        query = "SELECT AlbumName FROM AlbumName"

        # Execute the query
        cursor.execute(query)

        # Fetch all the results
        album_records = cursor.fetchall()

        # Iterate through each record and check for the user input in the artist_name field
        ok = 0
        for record in album_records:
            album_name = record[0]
            if user_input in album_name:
                print(f"'{user_input}' exists in album name: {album_name}")
                ok = 1
        if(ok == 0):
            print(f"'{user_input}' does not exist in albums")
        
    except mysql.connector.Error as e:
        print(f"An error occurred: {e}")