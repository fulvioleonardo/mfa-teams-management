# Reset-MFA.Tests.ps1
# This file contains unit tests for the Reset-MFA script using the Pester testing framework.

Describe "Reset-MFA Function Tests" {
    Mock -CommandName "Import-Module" -MockWith { }

    Before {
        # Setup code to run before each test
        Import-Module -Name "../src/modules/MFAModule.psm1"
    }

    It "Should reset MFA for a user if requester has permissions" {
        # Arrange
        $requesterUPN = "requester@example.com"
        $userUPN = "user@example.com"
        # Simulate permission check
        Mock -CommandName "Check-Permissions" -MockWith { return $true }

        # Act
        $result = Reset-MFA -RequesterUPN $requesterUPN -UserUPN $userUPN

        # Assert
        $result | Should -Be "MFA reset successfully for user: $userUPN"
    }

    It "Should not reset MFA if requester lacks permissions" {
        # Arrange
        $requesterUPN = "requester@example.com"
        $userUPN = "user@example.com"
        # Simulate permission check
        Mock -CommandName "Check-Permissions" -MockWith { return $false }

        # Act
        $result = Reset-MFA -RequesterUPN $requesterUPN -UserUPN $userUPN

        # Assert
        $result | Should -Be "Permission denied for requester: $requesterUPN"
    }

    It "Should handle errors gracefully" {
        # Arrange
        $requesterUPN = "requester@example.com"
        $userUPN = "user@example.com"
        # Simulate an error during MFA reset
        Mock -CommandName "Reset-MFA" -MockWith { throw "Reset failed" }

        # Act
        { Reset-MFA -RequesterUPN $requesterUPN -UserUPN $userUPN } | Should -Throw "Reset failed"
    }
}