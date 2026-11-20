# Microsoft Entra ID JML — read-only validation
# Requires Microsoft.Graph.Authentication, Microsoft.Graph.Users, Microsoft.Graph.Groups
# Sign in with an account authorized to read users and groups.
Connect-MgGraph -Scopes "User.Read.All","Group.Read.All" -UseDeviceCode

$upn = "dharris@mortonrock380gmail.onmicrosoft.com"
$user = Get-MgUser -UserId $upn -Property Id,DisplayName,Department,JobTitle,AccountEnabled -ErrorAction Stop
$user | Select-Object DisplayName,Department,JobTitle,AccountEnabled

# Direct membership check; use the known group ID, not display-name inference.
$financeGroups = @(Get-MgGroup -Filter "displayName eq 'SG-FIN-Financial-Analysts'" -All -ErrorAction Stop)
if ($financeGroups.Count -ne 1) { throw "Expected exactly one Finance group; found $($financeGroups.Count)." }
$finance = $financeGroups[0]
$matches = @(Get-MgGroupMember -GroupId $finance.Id -All -ErrorAction Stop | Where-Object { $_.Id -eq $user.Id })
if ($matches.Count -eq 0) {
    Write-Output "PASS: Daniel is not a direct member of the Finance group."
} else {
    Write-Output "FAIL: Daniel is still a direct member of the Finance group."
}
if ($user.AccountEnabled -eq $false) {
    Write-Output "PASS: Cloud account is disabled."
} else {
    Write-Output "FAIL: Cloud account is not disabled."
}
# This does not verify sign-in denial, token revocation, or application access.
