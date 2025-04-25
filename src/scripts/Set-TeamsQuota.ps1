<#
.SYNOPSIS
    Sets the quota for a specified Microsoft Teams group.
.DESCRIPTION
    This script checks if the requester has the necessary permissions to modify the Teams group's quota.
    If permitted, it increases the quota for the specified Teams group in SharePoint.
.PARAMETER RequesterUPN
    The UPN of the requester.
.PARAMETER TeamsGroup
    The name of the Teams group to modify.
.PARAMETER SpaceAmount
    The amount of space to allocate (in MB). If not specified, defaults to 100 MB.
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$RequesterUPN,

    [Parameter(Mandatory = $true)]
    [string]$TeamsGroup,

    [int]$SpaceAmount = 100
)

# Import the TeamsQuotaModule
Import-Module "$PSScriptRoot\..\modules\TeamsQuotaModule.psm1"

# Check permissions and set the Teams quota
$result = Set-TeamsQuota -RequesterUPN $RequesterUPN -TeamsGroup $TeamsGroup -SpaceAmount $SpaceAmount

# Output the result
if ($result.Success) {
    Write-Output "Quota for Teams group '$TeamsGroup' has been successfully set to $SpaceAmount MB."
} else {
    Write-Output "Failed to set quota: $($result.ErrorMessage)"
}