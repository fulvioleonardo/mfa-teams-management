# Set-TeamsQuota Documentation

## Overview
The `Set-TeamsQuota` script is designed to manage the storage quota for Microsoft Teams groups. It allows authorized users to increase the storage capacity of a specified Teams group in SharePoint.

## Functionality
This script checks if the requester has the necessary permissions to modify the Teams group's quota. If authorized, it will increase the quota by the specified amount or a default of 100 MB if no amount is provided.

## Parameters
- **RequesterUPN**: The User Principal Name (UPN) of the requester who is attempting to change the quota.
- **TeamsGroup**: The identifier for the Teams group whose quota is to be modified.
- **SpaceAmount** (optional): The amount of space to allocate to the Teams group, specified in megabytes (MB) or gigabytes (GB). If not provided, the default value is 100 MB.

## Outputs
- Success message indicating the new quota for the Teams group if the operation is successful.
- Error message detailing the reason for failure if the operation is not permitted or encounters an issue.

## Possible Failure Scenarios
- The requester does not have the necessary permissions to modify the Teams group's quota.
- The specified Teams group does not exist.
- The provided space amount is invalid or exceeds allowable limits.

## Logging
The script includes logging functionality to track actions taken and any errors encountered during execution. Logs are essential for troubleshooting and auditing purposes.

## Example Usage
```powershell
Set-TeamsQuota -RequesterUPN "requester@example.com" -TeamsGroup "TeamGroupName" -SpaceAmount 200
```

## Notes
Ensure that the requester has the appropriate permissions before executing this script to avoid unauthorized changes to Teams group quotas.