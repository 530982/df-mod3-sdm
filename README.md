# df-mod3-sdm

# Secure Data Management (SDM)

This project demonstrates secure data management techniques using PowerShell. The objective was to gather system information, manage files and folders, apply encryption, configure permissions, and create reusable scripts while maintaining confidentiality, integrity, and availability.

PowerShell commands were used to create directories, collect logs, search file contents, and export data for analysis.

### Folder Structure Created

* `1-Logs` – Contains system log outputs
* `2-SearchResults` – Contains CSV exports
* `3-Evidence` – Sample evidence files
* `3-Evidence-Encrypted` – Encrypted evidence copy
* `4-Backup` – Backup storage
* `5-ScriptEvidence` – Script-generated files

### Commands Used

Create directories:

```PowerShell
mkdir 1-Logs
mkdir 2-SearchResults
mkdir 3-Evidence
mkdir 4-Backup
```

Create evidence files:

```PowerShell
Set-Content 3-Evidence/file1.txt "User logged in with password123"
Set-Content 3-Evidence/file2.txt "Suspicious activity detected"
```

Collect Windows logs:

```PowerShell
Get-WinEvent -LogName System -MaxEvents 50 > 1-Logs/system_logs.txt
```

Search log contents:

```PowerShell
Get-Content 1-Logs/system_logs.txt | Select-String "error"
```

Export to CSV:

```PowerShell
Get-WinEvent -LogName System -MaxEvents 20 | Export-Csv 2-SearchResults/events.csv
```

These commands allow forensic investigators to gather and analyze system activity efficiently.

---

## Encryption and Access Control

Sensitive data was protected using encryption and restrictive permissions.

Encrypt evidence folder:

```PowerShell
cipher /E 3-Evidence
```

Copy and encrypt evidence:

```PowerShell
Copy-Item 3-Evidence 3-Evidence-Encrypted -Recurse
cipher /E 3-Evidence-Encrypted
```

Retrieve ACL permissions:

```PowerShell
Get-Acl 3-Evidence > 3-Evidence-ACL.txt
Get-Acl 3-Evidence-Encrypted > 3-Evidence-Encrypted-ACL.txt
```

Restrict permissions:

```PowerShell
icacls 3-Evidence-Encrypted /inheritance:r
icacls 3-Evidence-Encrypted /grant:r $env:USERNAME:R
```

These steps ensure:

* Confidentiality through encryption
* Integrity through restricted permissions
* Availability through organized backups

---

## Managing Permissions

Permissions were configured to prevent accidental modification of evidence.

Set file to read-only:

```PowerShell
attrib +R 3-Evidence\file1.txt
```

Verify permissions:

```PowerShell
Get-Acl 3-Evidence
```

Setting files to read-only ensures forensic evidence cannot be overwritten.

---

## PowerShell Scripting

A PowerShell script was created to automate backup and protection tasks.

### Script Name

`backup-script.ps1`

### Script Functions

* Creates an evidence folder
* Generates sample files
* Copies files to backup directory
* Sets backup files to read-only
* Displays confirmation message

### Script Code

```PowerShell
# Create Evidence Folder
New-Item -ItemType Directory -Path "5-ScriptEvidence" -Force

# Create Sample Files
Set-Content "5-ScriptEvidence/log1.txt" "Login attempt detected"
Set-Content "5-ScriptEvidence/log2.txt" "Unauthorized access attempt"

# Copy to Backup Folder
Copy-Item "5-ScriptEvidence" "4-Backup/ScriptBackup" -Recurse -Force

# Set Read-Only Permissions
attrib +R "4-Backup/ScriptBackup\*.*"

Write-Host "Backup and protection complete."
```

This script demonstrates automation of secure backup creation and protection.

---

## How This Applies to Digital Forensics

These techniques are useful in forensic investigations to:

* Collect system logs for analysis
* Secure evidence using encryption
* Prevent modification using read-only permissions
* Maintain backups of critical evidence
* Automate repetitive tasks using scripts

---

## Screenshots Included

The following verification screenshots are included in this repository:

* PowerShell commands running
* Folder creation and structure
* Encryption commands
* Permission changes
* Script creation in VS Code
* Script execution
* Backup folder results
* Git commit and push

---

## Conclusion

This project demonstrated how PowerShell can be used for secure data management. By combining file organization, encryption, permission management, and scripting, it is possible to maintain confidentiality, integrity, and availability of digital evidence. These skills are essential for digital forensics and system administration.
