import mysql.connector

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
