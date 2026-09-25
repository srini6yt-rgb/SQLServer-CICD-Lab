param
(
    [Parameter(Mandatory = $true)]
    [ValidateSet("DEV","TEST","PROD")]
    [string]$Environment,

    [string]$Server = "localhost",

    [string]$Dacpac = "E:\CICD\SQL-CICD-Lab\CICDDemoDB\bin\Debug\CICDDemoDB.dacpac"
)

$Database = switch ($Environment)
{
    "DEV"  { "CICD_DEV" }
    "TEST" { "CICD_TEST" }
    "PROD" { "CICD_PROD" }
}

Write-Host "================================="
Write-Host "SQL Server Database Deployment"
Write-Host "================================="
Write-Host "Environment : $Environment"
Write-Host "Server      : $Server"
Write-Host "Database    : $Database"
Write-Host "DACPAC      : $Dacpac"
Write-Host "================================="

if (-not (Test-Path $Dacpac))
{
    throw "DACPAC not found: $Dacpac"
}

$ConnectionString =
    "Server=$Server;Database=$Database;Integrated Security=True;TrustServerCertificate=True"

Write-Host "Generating deployment report..."

sqlpackage `
    /Action:DeployReport `
    /SourceFile:$Dacpac `
    /TargetConnectionString:$ConnectionString `
    /OutputPath:"E:\CICD\SQL-CICD-Lab\Deploy\$Environment-DeployReport.xml"

if ($LASTEXITCODE -ne 0)
{
    throw "DeployReport failed."
}

Write-Host "Deployment report generated."

if ($Environment -eq "PROD")
{
    Write-Host ""
    $Confirmation = Read-Host "Type PROD to continue with production deployment"

    if ($Confirmation -ne "PROD")
    {
        Write-Host "Production deployment cancelled."
        exit 1
    }
}

Write-Host "Publishing DACPAC..."

sqlpackage `
    /Action:Publish `
    /SourceFile:$Dacpac `
    /TargetConnectionString:$ConnectionString

if ($LASTEXITCODE -ne 0)
{
    throw "Database deployment failed."
}

Write-Host ""
Write-Host "Deployment completed successfully."