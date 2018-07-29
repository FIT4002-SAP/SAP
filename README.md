# SAP IoT Demo
## Running the app
### Steps to run app on XCODE v9.4.1
1. Clone this repository
2. Run `./init.sh`; this downloads the necessary dependencies. If this does not work, see below ('How to download prerequisite frameworks').

### Dependencies
#### How to download prerequisite frameworks
1. Download: https://drive.google.com/file/d/1eoNza-pl9REl77vCTxnxqFMZIxTVc9-F/view?usp=sharing
2. Unzip the .zip file; it contains:
```
SAPCommon.framework
SAPFiori.framework
SAPFioriFlows.framework
SAPFoundation.framework
SAPOData.framework
SAPOfflineOData.framework
```
3. Put the .framework files here: `./FIT4002-v1/*.framework`

# Pull requests
## Making a pull request
Before making a pull request, please consider the following:
* Does the proposed change come with unit/integration tests in order to test the introduced feature(s)?
* Have you cleaned up your commit and/or merged with the latest `master` branch?
* Have your code been documented sufficiently so that your team members can understand your changes in a reasonable amount of time?

## Merging a pull request
* **Pull requests should ONLY be merged when it has 2 approvals from the team (excluding the main assignee).**
* Pull request comments must be addressed before merging.
* Notify the team when merging a pull request (sending a quick message is sufficient enough).

# Extra Information
Current iot url: https://iotmmsdbp2000319942trial.hanatrial.ondemand.com/iotmmsxs/iotservice.xsodata

This app is generated using SAP Cloud Platform SDK for iOS Assistant.

More information about the structure of the generated application can be found on help.sap.com:
https://help.sap.com/viewer/fc1a59c210d848babfb3f758a6f55cb1/Latest/en-US/c14683672e9d4df383e8fced4ea9a019.html
