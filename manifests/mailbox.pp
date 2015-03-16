define exchange::mailbox(
  $name
  $upn,
  $alias,
  $database
  $ou,
  $password,
  $firstname,
  $lastname,
  $displayname,
  $resetpasswordonnextlogon,
  $importdatafile,
  ){

  unless $name = undef {
    $options += "-Name $name",
  }
  unless $upn = undef {
    $options += "-UserPrincipalName $upn",
  }
  unless $alias = undef {
    $options += "-Alias $alias",
  }
  unless $database = undef {
    $options += "-Database $database",
  }
  unless $ou = undef {
    $options += "-OrganizationUnit $ou",
  }
  unless $password = undef {
    $options += "-Password $password",
  }
  unless $firstname = undef {
    $options += "-FirstName $firstname",
  }
  unless $lastname = undef {
    $options += "-LastName $lastname",
  }
  unless $displayname = undef {
    $options += "-DisplayName $displayname",
  }
  unless $resetpasswordonnextlogon = undef {
    $options += "-ResetPasswordOnNextLogon $resetpasswordonnextlogon",
  }

  exec { 'Enable-Mailbox':
    command => "Enable-Mailbox $options",
    onlyif => "query for user true",
    unless => "query for mailbox true",
  }

  exec { 'New-Mailbox':
    command => "New-Mailbox $options",
    unless => "query for mailbox true",
    require => Exec ['Enable-Mailbox'],
  }
}
