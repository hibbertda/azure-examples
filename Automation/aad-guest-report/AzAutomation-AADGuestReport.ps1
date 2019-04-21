# Output type (JSON/CSV)
$outputType = "JSON"

# Resource Variables
$storageAccountName = "msdnuserreport"
$resourceGroupname = "msdn-automation"

# Connect to Azure using automation RunAS account
$connectionName = "AzureRunAsConnection"
try {
    # Get the connection "AzureRunAsConnection "
    $servicePrincipalConnection=Get-AutomationConnection -Name $connectionName         

    "Logging in to Azure AD"
    Connect-AzureAD `
        -TenantId $servicePrincipalConnection.TenantId `
        -ApplicationId $servicePrincipalConnection.ApplicationId `
        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 

    "Logging in to Azure..."
    Add-AzureRmAccount `
        -ServicePrincipal `
        -TenantId $servicePrincipalConnection.TenantId `
        -ApplicationId $servicePrincipalConnection.ApplicationId `
        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint         
}
catch {
    if (!$servicePrincipalConnection){
        $ErrorMessage = "Connection $connectionName not found."
        throw $ErrorMessage
    } 
    else {
        Write-Error -Message $_.Exception
        throw $_.Exception
    }
}

# Select storage account for storing report
Set-AzureRMCurrentStorageAccount -storageAccountName $storageAccountName -ResourceGroupName $resourceGroupname

# Get list of all external users
$GuestUsers = Get-AzureADUser -filter "usertype eq 'guest'"

$fileName = "AADGuestReport_"+$(get-date -Format MMddyyyy-hhmmss)

switch ($outputType){
    "JSON" {
        # Format list of guest users in JSON
        $GuestUsers | ConvertTo-Json | Out-File $($filename+".json")
        
        # Copy report JSON to Azure Blob storage
        Set-AzureStorageBlobContent -Container "incomingreports" `
            -file $($filename+".json") `
            -blob $($filename+".json")
    }
    "CSV" {
        # Format list of guest users in CSV
        $GuestUsers | export-csv -path $($filename+".csv") -NoTypeInformation
        
        # Copy report CSV to Azure Blob storage
        Set-AzureStorageBlobContent -Container "incomingreports" `
            -file $($filename+".csv") `
            -blob $($filename+".csv")
    }
}