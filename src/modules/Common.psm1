Sure, here's the contents for the file `/mfa-teams-management/mfa-teams-management/src/modules/Common.psm1`:

function Check-Permissions {
    param (
        [string]$RequesterUPN,
        [string]$RequiredGroup
    )
    
    # Logic to check if the requester is in the required group
    # Return $true if they have permissions, otherwise $false
}

function Log-Action {
    param (
        [string]$Message
    )
    
    # Logic to log the action taken
    Write-Host $Message
}