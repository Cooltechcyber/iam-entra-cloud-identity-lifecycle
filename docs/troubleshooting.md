# Troubleshooting — Microsoft Graph PowerShell authentication

## Issue observed

An initial `Connect-MgGraph -Scopes "User.Read.All","Group.Read.All"` attempt failed with a Windows Web Account Manager (WAM) interactive-browser window-handle error.

## Resolution verified

Device code authentication succeeded:

```powershell
Connect-MgGraph -Scopes "User.Read.All","Group.Read.All" -UseDeviceCode
Get-MgContext | Select-Object Account, TenantId, Scopes
```

The lab also encountered command-line copy/paste errors: an accidental `-UseDeviceCode+` suffix and two concatenated `Connect-MgGraph` commands caused parameter-binding failures. Correcting the command syntax resolved those errors. A later `Authentication needed. Please call Connect-MgGraph` message was resolved by reconnecting in the active PowerShell session.

## Lessons learned

- Read the full error text before changing tenant settings.
- Use a supported authentication flow appropriate for the terminal environment.
- Reconnect when Graph context is absent or expired.
- Use least-privilege delegated scopes for read-only validation.
- Never commit device codes, tokens, passwords, or unnecessary tenant identifiers.
