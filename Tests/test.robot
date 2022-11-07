*** Settings ***
Documentation   DQ checks for [AdventureWorks2012] database

Resource     variables.robot

Suite Setup     Connect To Database     pymssql  ${DBName}  ${DBUser}   ${DBPass}   ${DBServer}

*** Test Cases ***
Verify row count
    [Tags]  [Person].[Address] Table
    [Documentation]
    ...  |
    ...  | TC1. Verify Row Count
    ...  |
    row count is equal to x    SELECT * FROM [AdventureWorks2012].[Person].[Address];   19614

get count unique StateProvinceID values
    [Tags]  [Person].[Address] Table
    [Documentation]
    ...  |
    ...  | TC2. Verify uniquness of StateProvinceID column
    ...  |
    get count    SELECT COUNT(DISTINCT StateProvinceID) FROM [AdventureWorks2012].[Person].[Address];    74

get count Not Null AddresLine2 values
    [Tags]  [Person].[Address] Table
    [Documentation]
    ...  |
    ...  | TC3. Verify count of not null AddressLine2
    ...  |
    get count    SELECT COUNT(*) FROM [AdventureWorks2012].[Person].[Address] WHERE AddressLine2 is not null;    362

ModifiedDate in the future
    [Tags]  [Person].[Address] Table
    [Documentation]
    ...  |
    ...  | TC4. Check that no exist ModifiedDate in the future
    ...  |
    get count     SELECT COUNT(*) FROM [AdventureWorks2012].[Person].[Address] WHERE ModifiedDate > GETDATE();    0

Max lenght of DocumentSummary
    [Tags]  [Production].[Document] Table
    [Documentation]
    ...  |
    ...  | TC5. Check MAX length of the DocumentSummary column
    ...  |
    length should be    SELECT MAX(DocumentSummary) FROM [AdventureWorks2012].[Production].[Document];      78

Flag value not in range
    [Tags]  [Production].[Document] Table
    [Documentation]
    ...  |
    ...  | TC6. Check the FolderFlag column values in the valid range
    ...  |
    get count    SELECT COUNT(*) FROM [AdventureWorks2012].[Production].[Document] WHERE FolderFlag NOT IN (0,1);   0

Count unique values
    [Tags]  [Production].[UnitMeasure] Table
    [Documentation]
    ...  |
    ...  | TC7. Check the that measures are unique
    ...  |
    ${output}=    Execute SQL String    SELECT CASE WHEN COUNT(distinct UnitMeasureCode) = COUNT(Distinct Name) THEN 'TRUE' ELSE 'FALSE' END FROM [AdventureWorks2012].[Production].[UnitMeasure];
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Duplicates
    [Tags]  [Production].[UnitMeasure] Table
    [Documentation]
    ...  |
    ...  | TC8. Duplicates check
    ...  |
    row count is equal to x    SELECT [UnitMeasureCode],[Name],[ModifiedDate],COUNT(*) FROM [AdventureWorks2012].[Production].[UnitMeasure] GROUP BY [UnitMeasureCode],[Name],[ModifiedDate] HAVING COUNT(*) > 1;    0