import subprocess as sp
import mysql.connector

# Function to handle hiring an employee
def hire_an_employee(cursor, connection):
    try:
        # Takes employee details as input
        row = {}
        print("Enter new employee's details: ")
        name = input("Name (Fname Minit Lname): ").split(' ')
        row["Fname"] = name[0]
        row["Minit"] = name[1]
        row["Lname"] = name[2]
        row["Ssn"] = input("SSN: ")
        row["Bdate"] = input("Birth Date (YYYY-MM-DD): ")
        row["Address"] = input("Address: ")
        row["Sex"] = input("Sex: ")
        row["Salary"] = float(input("Salary: "))
        row["Dno"] = int(input("Dno: "))

        query = "INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Dno) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
        values = (row["Fname"], row["Minit"], row["Lname"], row["Ssn"], row["Bdate"], row["Address"], row["Sex"], row["Salary"], row["Dno"])

        cursor.execute(query, values)
        connection.commit()

        print("Inserted Into Database")

    except mysql.connector.Error as e:
        connection.rollback()
        print("Failed to insert into database")
        print("Error:", e)

# Function to handle other options (to be implemented)
def option2():
    print("Option 2 - Not implemented")

def option3():
    print("Option 3 - Not implemented")

def option4():
    print("Option 4 - Not implemented")

# Function to dispatch user choices
def dispatch(choice, cursor, connection):
    if choice == 1:
        hire_an_employee(cursor, connection)
    elif choice == 2:
        option2()
    elif choice == 3:
        option3()
    elif choice == 4:
        option4()
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
                    print("1. Hire an Employee")
                    print("2. Option 2")
                    print("3. Option 3")
                    print("4. Option 4")
                    print("5. Logout")

                    choice = int(input("Enter choice> "))

                    if choice == 5:
                        exit()
                    else:
                        dispatch(choice, cursor, connection)
                        tmp = input("Enter any key to CONTINUE>")

        except mysql.connector.Error as e:
            tmp = sp.call('clear', shell=True)
            print(e)
            print("Connection Refused: Either username or password is incorrect or user doesn't have access to the database")
            tmp = input("Enter any key to CONTINUE>")

if __name__ == "__main__":
    main()
