import subprocess as sp
import mysql.connector
from retrieval import *

# Function to handle hiring an employee
def option1(cursor, connection):
    try:
        table_name = input("Enter the table name: ")
        query = f"SELECT * FROM {table_name}"
        cursor.execute(query)

        records = cursor.fetchall()

        if records:
            print(f"\nContents of table {table_name}:\n")
            for record in records:
                print(record)
        else:
            print(f"\nTable {table_name} is empty.")
        connection.commit()

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to fetch data from the database")
        print("Error:", e)

def retrieve_option1(cursor, connection):
    try:
        artists_released_past_year(cursor, connection)

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to do sub-option 1 into database")
        print("Error:", e)

def retrieve_option2(cursor, connection):
    try:
        producer_id = int(input("Enter Producer ID: "))
        get_artists_by_producer(cursor, connection, producer_id)

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to do sub-option 2 into database")
        print("Error:", e)

def retrieve_option3(cursor, connection):
    try:
        genre = (input("Enter Genre: "))
        get_album_names_by_genre(cursor, connection, genre)

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to do sub-option 2 into database")
        print("Error:", e)

def retrieve_option4(cursor, connection):
    try:
        city = (input("Enter City: "))
        state = (input("Enter State: "))
        get_tours_by_location(cursor, connection, city, state)

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to do sub-option 2 into database")
        print("Error:", e)

def retrieve_option5(cursor, connection):
    try:
        total_released_albums(cursor, connection)

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to do sub-option 2 into database")
        print("Error:", e)

def retrieve_option6(cursor, connection):
    try:
        artist_with_min_albums(cursor, connection)

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to do sub-option 2 into database")
        print("Error:", e)

def retrieve_option7(cursor, connection):
    try:
        artist = input("Enter artist name: ")
        check_artist_name(cursor, connection, artist)

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to do sub-option 2 into database")
        print("Error:", e)

def retrieve_option8(cursor, connection):
    try:
        album = input("Enter album name: ")
        check_album_name(cursor, connection, album)

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to do sub-option 2 into database")
        print("Error:", e)

# Function to handle other options (to be implemented)
def option2(cursor, connection):
    try:
        while True:
            tmp = sp.call('clear', shell=True)
            # Display sub-menu options for option 2
            print("Option 2:")
            # Selection
            print("1. Artists who released albums in the past year")
            print("2. Discover Artists Under the Guidance of a Specific Producer")
            # Projection
            print("3. Searching by Genre")
            print("4. Searching tours in a certain Location")
            # Aggregate
            print("5. Total released albums")
            print("6. Spotlighting the Minimalist Artist")
            # Search
            print("7. Artist Name Lookup")
            print("8. Album Name Search")
            print("9. Back to main menu")

            sub_choice = int(input("Enter sub-choice> "))

            if sub_choice == 9:
                break  # Go back to the main menu
            elif sub_choice == 1:
                retrieve_option1(cursor, connection)
            elif sub_choice == 2:
                retrieve_option2(cursor, connection)
            elif sub_choice == 3:
                retrieve_option3(cursor, connection)
            elif sub_choice == 4:
                retrieve_option4(cursor, connection)
            elif sub_choice == 5:
                retrieve_option5(cursor, connection)
            elif sub_choice == 6:
                retrieve_option6(cursor, connection)
            elif sub_choice == 7:
                retrieve_option7(cursor, connection)
            elif sub_choice == 8:
                retrieve_option8(cursor, connection)

            else:
                print("Error: Invalid Sub-Option")

            tmp = input("Press enter to CONTINUE>")

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to do option2 into database")
        print("Error:", e)

def option3(cursor, connection):
    try:
        print("Option 3 - Not implemented")

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to do option3 into database")
        print("Error:", e)

def option4(cursor, connection):
    try:
        print("Option 4 - Not implemented")

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to do option4 into database")
        print("Error:", e)

def option5(cursor, connection):
    try:
        query = f"SHOW TABLES"
        cursor.execute(query)

        records = cursor.fetchall()

        if records:
            print(f"\nTables:\n")
            for record in records:
                print(record)
        else:
            print(f"\nNo table found")
        connection.commit()

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to fetch data from the database")
        print("Error:", e)

def option6(cursor, connection):
    try:
        table_name = input("Enter the table name: ")
        query = f"DESC {table_name}"
        cursor.execute(query)

        records = cursor.fetchall()

        if records:
            print(f"\nTables:\n")
            for record in records:
                print(record)
        else:
            print(f"\nNo table found")
        connection.commit()

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to fetch data from the database")
        print("Error:", e)

# Function to dispatch user choices
def dispatch(choice, cursor, connection):
    if choice == 1:
        option1(cursor, connection)
    elif choice == 2:
        option2(cursor, connection)
    elif choice == 3:
        option3(cursor, connection)
    elif choice == 4:
        option4(cursor, connection)
    elif choice == 5:
        option5(cursor, connection)
    elif choice == 6:
        option6(cursor, connection)
    else:
        print("Error: Invalid Option")

# Main function
def main():
    while True:
        try:
            tmp = sp.call('clear', shell=True)
            
            # Get user input for database connection
            username = input("Username: ")
            password = input("Password: ")

            # Establish a connection to the database
            connection = mysql.connector.connect(
                host='localhost',
                user=username,
                password=password,
                database='finalphase4'
            )

            tmp = sp.call('clear', shell=True)

            if connection.is_connected():
                print("\nWelcome to MUS3RHQ Label\n")
            else:
                print("Failed to connect")

            tmp = input("Press enter to CONTINUE>")

            with connection.cursor() as cursor:
                while True:
                    tmp = sp.call('clear', shell=True)
                    # Display menu options
                    print("1. View Tables")
                    print("2. Retrieval")
                    print("3. Modification")
                    print("4. Functional Analysis")
                    print("5. List all tables")
                    print("6. Describe a table")
                    print("7. Logout")

                    choice = int(input("Enter choice> "))

                    if choice == 7:
                        exit()
                    else:
                        dispatch(choice, cursor, connection)
                        tmp = input("Press enter to CONTINUE>")

        except mysql.connector.Error as e:
            tmp = sp.call('clear', shell=True)
            print(e)
            print("Connection Refused: Either username or password is incorrect or user doesn't have access to the database")
            tmp = input("Enter any key to CONTINUE>")

if __name__ == "__main__":
    main()