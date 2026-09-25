param
(
    [Parameter(Mandatory = $true)]
    [ValidateSet("DEV","TEST","PROD")]
    [string]$Environment
)

$Database = switch ($Environment)
{
    "DEV"  { "CICD_DEV" }
    "TEST" { "CICD_TEST" }
    "PROD" { "CICD_PROD" }
}

$Query = @"
SELECT
    COUNT(*) AS ObjectCount
FROM [$Database].sys.objects
WHERE is_ms_shipped = 0;
"@

$result = Invoke-Sqlcmd `
    -ServerInstance "localhost" `
    -Database "master" `
    -Query $Query

Write-Host "Environment: $Environment"
Write-Host "Object Count: $($result.ObjectCount)"