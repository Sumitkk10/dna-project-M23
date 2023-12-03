##functional analysis########

import mysql.connector

def get_high_grossing_collaboration(cursor, db_connection):
    try:
        # SQL query to find the highest grossing album's artist and associated producer
        query = """
            SELECT ar.artist_name AS Artist, pr.producer_id, pr.employee_id, pr.total_revenue AS Producer_Revenue
            FROM Album a
            JOIN Artists ar ON a.AlbumID = ar.album_id
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
                Album al ON ar.album_id = al.AlbumID
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