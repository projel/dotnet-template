Write-Host "🔧 Restaurando ferramentas .NET..."
dotnet tools restore

Write-Host "🔒 Aplicando chmod via Git Bash..."
bash -c "chmod +x ./protect-commits.sh"
