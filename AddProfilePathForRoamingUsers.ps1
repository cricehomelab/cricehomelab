#Import the AD module
Import-Module ActiveDirectory

#Get all members of the roaming profile group and set the correct network profile path for them. 
Get-ADGroupMember 'Roaming Profile Users' | 
    # loop through the users and set their profile path. 
    ForEach-Object {
    # Set the profile path for each user in the list. 
    Set-ADUser -Identity $_.SamAccountName -ProfilePath("\\domainctl-01\RoamingUserProfiles$\" + $_.SamAccountName)
    }