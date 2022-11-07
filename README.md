# Environment setup

## Name and description of project
Project pythonProjectOwn contains determined automated test cases
of 2 tables - Jobs and Employees, that have specific tag-name to link to Jira issues.
It's implemented in BBD-approach, where each test cases have steps to reproduce(with description) and expected results.

## Create virtual environment for tests execution
```bash
pip install -r requirements.txt
```

## Deploy and configure Data Quality solution
Follow [instructions](../README.md)

## Run robot tests
```bash
robot -d Output Tests/test.robot
```

# Report portal integration with Robot Framework
For the integration library [robotframework-reportportal](https://github.com/reportportal/agent-Python-RobotFramework)
is used. This is an officially supported library for RF from report portal community.

To implement the integration you will need to add `robotframework-reportportal` dependency to your RF project and 
add some commands to the script of starting your test cases.

# Report portal

All the results after execution using command from 'Run robot tests' will be located in folder Output - log.html and report.html with detailed results of test cases.
