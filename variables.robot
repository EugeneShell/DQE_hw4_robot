*** Settings ***
Documentation   Robot resources and variables for all tests

Library    DatabaseLibrary
Library    OperatingSystem

*** Variables ***
${DBName}       AdventureWorks2012
${DBUser}       test_user
${DBPass}       123456
${DBServer}     EPBYVITW0125\SQLEXPRESS
