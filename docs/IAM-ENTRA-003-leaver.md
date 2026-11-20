# IAM-ENTRA-003 — Cloud Leaver / Offboarding

**Scenario:** Fictional employee Daniel Harris leaves the organization. **Authorization:** Simulated lab offboarding ticket.

## Before

- Department: Finance
- Job title: Financial Systems Analyst
- Account enabled: True
- Group: `SG-FIN-Financial-Analysts`

## Change performed

1. Disabled Daniel's cloud user account in Entra ID, retaining the object for audit purposes.
2. Removed his direct membership from `SG-FIN-Financial-Analysts`.
3. Reconnected Microsoft Graph PowerShell after the earlier session was no longer authenticated.
4. Queried the Finance group's members for Daniel's object ID; no matching member was returned and no error was shown.
5. Queried Daniel's account attributes; `AccountEnabled` returned `False`.

## Observed validation

```text
DisplayName   Department JobTitle                  AccountEnabled
Daniel Harris Finance    Financial Systems Analyst False
```

Finance group direct-member filter returned **no matching output**.

**Result:** PASS — directory account disabled and Finance group membership removal validated. **Not verified:** sign-in denial, token/session revocation, application-specific deprovisioning, or removal from all other services.

## Evidence checklist

- `15-entra-leaver-account-disabled.png`
- `16-entra-leaver-finance-membership-removed.png`
- `17-entra-leaver-graph-account-verification.png`
- `18-entra-leaver-graph-group-verification.png`

See [validation commands](../scripts/validation-commands.ps1).

## Screenshot evidence

**15-entra-leaver-account-disabled.png**

![15 entra leaver account disabled](../screenshots/15-entra-leaver-account-disabled.png)

**16-entra-leaver-finance-membership-removed.png**

![16 entra leaver finance membership removed](../screenshots/16-entra-leaver-finance-membership-removed.png)

**17-entra-leaver-graph-account-verification.png**

![17 entra leaver graph account verification](../screenshots/17-entra-leaver-graph-account-verification.png)

**18-entra-leaver-graph-group-verification.png**

![18 entra leaver graph group verification](../screenshots/18-entra-leaver-graph-group-verification.png)
