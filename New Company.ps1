#Freshdesk API
$fresh_API = "Your API Key"

#Build Header
$Bytes = [System.Text.Encoding]::Unicode.GetBytes("$($fresh_API):X")
$EncodedText = [Convert]::ToBase64String($Bytes)

$fresh_header = @{ 
    Authorization = "Basic $EncodedText" 
} 





#Get Freshdesk Companies
$FreshCompanies = Invoke-RestMethod -Method GET -Uri "https://*YourEndPoint*.freshdesk.com/api/v2/companies?per_page=20" -Headers $fresh_header -ContentType "application/json" 
#$FreshCompanies = Invoke-RestMethod -Method GET -Uri "https://*YourEndPoint*.freshdesk.com/api/v2/companies?per_page=30" -Headers $fresh_header -ResponseHeadersVariable ResponseHEader
    





#New Company
[hashtable]$body = @{}
$Body.name = "au2mator"
$Body.domains = @(
    "au2mator.com"
)
$Json = $body | ConvertTo-Json

Invoke-RestMethod -Method POST -Uri "https://*YourEndPoint*.freshdesk.com/api/v2/companies" -Headers $fresh_header -ContentType "application/json" -Body $json 