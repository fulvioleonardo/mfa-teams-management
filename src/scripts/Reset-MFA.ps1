<#
.SYNOPSIS
    Resets the Multi-Factor Authentication (MFA) for a specified user.
.DESCRIPTION
    This script checks if the requester has the necessary permissions to reset the MFA for a user.
    If permitted, it calls the Reset-MFA function from the MFAModule to perform the action.
.PARAMETER RequesterUPN
    The UPN of the requester who is attempting to reset the MFA.
.PARAMETER UserUPN
    The UPN of the user whose MFA is to be reset.
.EXAMPLE
    .\Reset-MFA.ps1 -RequesterUPN "requester@example.com" -UserUPN "user@example.com"
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$RequesterUPN,

    [Parameter(Mandatory = $true)]
    [string]$UserUPN
)

# Import the MFA module
Import-Module "$PSScriptRoot\..\modules\MFAModule.psm1"

# Call the Reset-MFA function
$result = Reset-MFA -RequesterUPN $RequesterUPN -UserUPN $UserUPN

# Output the result
if ($result.Success) {
    Write-Output "MFA for user $UserUPN has been successfully reset."
} else {
    Write-Output "Failed to reset MFA for user $UserUPN. Reason: $($result.ErrorMessage)"
}