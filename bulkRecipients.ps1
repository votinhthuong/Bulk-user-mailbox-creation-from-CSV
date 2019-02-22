<#
 # Bulk Mailbox creation for Exchange.
 Will create Mailbox's & AD Users.
 CSV / script can be expanded to create more attributes.

Steve Lindsey
11/11/2013

#>
#csv format needs to be as follows:
#Alias,Firstname, Lastname,Name,UPN,OUpath,MBDB,password
#change the name and path of the csv file as required.

 
$users = Import-CSV "C:\bulk_users.csv" 
$users| foreach {
    $Password = convertto-securestring $_.password -asplaintext -force
    new-mailbox -name $_.name -alias $_.alias -FirstName $_.Firstname -LastName $_.Lastname -userPrincipalName  $_.UPN -Database $_.MBDB -OrganizationalUnit $_.OUpath -Password $Password –ResetPasswordOnNextLogon:$false
}
