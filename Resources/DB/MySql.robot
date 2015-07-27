*** Settings ***
Library  DatabaseLibrary
Library  String
Library  DateTime
Library  Dialogs
Variables   ${CURDIR}/config.py    db                       #imports database connection settings

*** Variables ***
${PREVIOUS_ROW_COUNT}

*** Keywords ***

Save Current Row Count
    ${current_row_count} =  Row Count  SELECT * FROM personal_details;
    Set Suite Variable  ${PREVIOUS_ROW_COUNT}  ${current_row_count}
    Log  ${current_row_count}

Get Input Data
    # from the dialogs library
    ${firstname} =  Get Value From User  Enter a First Name
    ${surname} =  Get Value From User  Enter a Surname
#    ${dob} =  Get Value From User  Enter a Date of Birth
    # save it at the suite scope so subsequent test can use it
    Set Suite Variable  ${FIRST_NAME}  ${firstname}
    Set Suite Variable  ${SURNAME}  ${surname}
   # Set Suite Variable  ${DOB}  ${dob}

Insert Record
    # Optional: Use these commented lines to create your table if necessary
    #Delete All Rows From Table  DemoItems
    #Execute SQL String  DROP TABLE DemoItems
    #Execute SQL String  CREATE TABLE DemoItems (ItemId INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, ItemName VARCHAR(50) NOT NULL, FirstName VARCHAR(50) NOT NULL)

    # I wasn't able to get a DateTime value inside the query like I did on SQL Server
    # so had to do it on a separate line. This is from the DateTime library.
    # For some reason, Pycharm/Intellibot doesn't recognize it and underlines it
   # ${current_date} =  Get Current Date

    # notice I've put the variables inside single quotes
    ${insert_command} =  Set Variable  INSERT INTO personal_details (firstName, surname, dob) VALUES ('${FIRST_NAME}', '${SURNAME}','2000/01/01')
    Execute SQL String  ${insert_command}

Verify New Record Added
    ${new_row_count} =  Row Count  SELECT * FROM personal_details;
    Log  ${new_row_count}
    # notice that I'm using +1 INSIDE the braces, not after the final brace
    Should be Equal as Numbers  ${new_row_count}  ${PREVIOUS_ROW_COUNT + 1 }

Verify Last Record
    # notice here we use LIMIT 1 instead of TOP 1 in SQL Server
    ${queryResults} =  Query  SELECT * FROM personal_details ORDER BY surname, firstname DESC LIMIT 1
    # Examine the (0-based)  field of the first record in the results
    Should be Equal as Strings  ${queryResults[0][1]}  ${SURNAME}
    Log  ${queryResults[0][2]}

Log All Rows
    ${queryResults} =  Query  SELECT * FROM personal_details ORDER BY surname
    Log Many  ${queryResults}
