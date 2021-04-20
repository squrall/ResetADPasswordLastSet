Import-Module ActiveDirectory

$ADusers = Get-ADUser -Filter 'Name -like "*kelley*"' -Properties name, pwdlastset -SearchBase "OU=PCC OU's, OU=Pacific Crest, DC=PacCrest, DC=local"

foreach($user in $ADusers){
   $user = Get-Aduser $user -Properties pwdlastset

   $user.pwdlastset = 0
   Set-ADUser -Instance $user

   $user.pwdlastset = -1
   Set-ADUser -Instance $user
}
