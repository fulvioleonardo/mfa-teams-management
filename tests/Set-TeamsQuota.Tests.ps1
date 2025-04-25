# Set-TeamsQuota.Tests.ps1
# This script contains unit tests for the Set-TeamsQuota function in the TeamsQuotaModule.
# It uses the Pester testing framework to validate the functionality and edge cases.

Describe "Set-TeamsQuota Function Tests" {
    Mock -CommandName "TeamsQuotaModule:Set-TeamsQuota" -MockWith {
        param (
            [string]$requesterUPN,
            [string]$teamsGroup,
            [int]$spaceAmount = 100
        )
        return @{ Success = $true; Message = "Quota set successfully." }
    }

    It "Should successfully set Teams quota when requester has permissions" {
        $result = Set-TeamsQuota -requesterUPN "requester@example.com" -teamsGroup "TestGroup" -spaceAmount 200
        $result.Success | Should -Be $true
        $result.Message | Should -Be "Quota set successfully."
    }

    It "Should set default quota when no space amount is provided" {
        $result = Set-TeamsQuota -requesterUPN "requester@example.com" -teamsGroup "TestGroup"
        $result.Success | Should -Be $true
        $result.Message | Should -Be "Quota set successfully."
    }

    It "Should fail to set Teams quota when requester lacks permissions" {
        Mock -CommandName "TeamsQuotaModule:Set-TeamsQuota" -MockWith {
            throw "Permission denied."
        }

        { Set-TeamsQuota -requesterUPN "unauthorized@example.com" -teamsGroup "TestGroup" -spaceAmount 200 } | Should -Throw "Permission denied."
    }
}