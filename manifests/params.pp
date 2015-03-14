class exchange::params (
  $installerlocation => 'http://care.dlservice.microsoft.com/dl/download/8/1/1/811B7C54-DA45-48AF-A912-0AA2B6FDA02C/Exchange-x64.exe',
  $setupmode,
  $acceptexchangelicense => true,
  $roles => ['CAS',Mailbox','Hub'],
  $installwindowscomponents,
  $orgname => "$::adsitename Exchange 2013"
  $targetdir,
  $sourcedir,
  $updatesdir,
  $domaincontroller => "$::pdc"
  $answerfile,
  $donotstarttransport,
  $enableerrorreporting,
  $customerfeedbackenabled,
  $addumlanguagepack,
  $removeumlanguagepack,
  $newprovisionedserver,
  $removeprovisionedserver
  $mdbname,
  $dbfilepath,
  $logfolderpath,
  $activedirectorysplitpermissions,
  $tenantorganizationconfig,
  ){
}
