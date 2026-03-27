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