# IAM-ENTRA-002 — Cloud Mover / Department Transfer

**Scenario:** Daniel Harris transfers from Information Technology to Finance. **Approval:** Simulated change ticket, not a real business authorization.

## Before

- Department: Information Technology
- Job title: IT Support Analyst
- Account enabled: True
- Verified membership: `SG-IT-Cloud-Users`

## Change performed

1. Reviewed existing assigned security groups and selected `SG-FIN-Financial-Analysts` as a lab candidate.
2. Updated Daniel's department to **Finance** and title to **Financial Systems Analyst**.
3. Removed his direct membership from `SG-IT-Cloud-Users`.
4. Added him to `SG-FIN-Financial-Analysts`.
5. Validated account attributes and returned memberships with Microsoft Graph PowerShell.

## Observed validation

```text
DisplayName   Department JobTitle                  AccountEnabled
Daniel Harris Finance    Financial Systems Analyst True

DisplayName
SG-FIN-Financial-Analysts
```

The previous IT group did not appear in the returned group list.

**Result:** PASS — directory-level department/title and group transition verified. No Finance application/resource access was tested; group assignment alone does not establish effective permissions.

## Evidence checklist

- `08-entra-existing-security-groups.png`
- `09-entra-finance-group-before-transfer.png`
- `10-entra-daniel-finance-properties.png`
- `11-entra-it-group-after-removal.png`
- `12-entra-finance-group-after-addition.png`
- `13-entra-mover-graph-user-verification.png`
- `14-entra-mover-graph-group-verification.png`

See [validation commands](../scripts/validation-commands.ps1).

## Screenshot evidence

**08-entra-existing-security-groups.png**

![08 entra existing security groups](../screenshots/08-entra-existing-security-groups.png)

**09-entra-finance-group-before-transfer.png**

![09 entra finance group before transfer](../screenshots/09-entra-finance-group-before-transfer.png)

**10-entra-daniel-finance-properties.png**

![10 entra daniel finance properties](../screenshots/10-entra-daniel-finance-properties.png)

**11-entra-it-group-after-removal.png**

![11 entra it group after removal](../screenshots/11-entra-it-group-after-removal.png)

**12-entra-finance-group-after-addition.png**

![12 entra finance group after addition](../screenshots/12-entra-finance-group-after-addition.png)

**13-entra-mover-graph-user-verification.png**

![13 entra mover graph user verification](../screenshots/13-entra-mover-graph-user-verification.png)

**14-entra-mover-graph-group-verification.png**

![14 entra mover graph group verification](../screenshots/14-entra-mover-graph-group-verification.png)
