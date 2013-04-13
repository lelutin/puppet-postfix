#
# == Class: postfix::satellite
#
# This class configures all local email (cron, mdadm, etc) to be forwarded
# to $root_mail_recipient, using $postfix_relayhost as a relay.
#
# $valid_fqdn can be set to override $fqdn in the case where the FQDN is
# not recognized as valid by the destination server.
#
# Parameters:
# - *valid_fqdn*
# - every global variable which works for class "postfix" will work here.
#
# Example usage:
#
#   node "toto.local.lan" {
#     class { 'postfix::satellite':
#       relayhost           => "mail.example.com"
#       valid_fqdn          => "toto.example.com"
#       root_mail_recipient => "the.sysadmin@example.com"
#     }
#   }
#
class postfix::satellite(
  $relayhost           = '',
  $valid_fqdn          = '',
  $root_mail_recipient = ''
) {

  # If $valid_fqdn exists, use it to override $fqdn
  case $valid_fqdn {
    "":      { $valid_fqdn = $::fqdn }
    default: { $fqdn = "${valid_fqdn}" }
  }

  class { 'postfix':
    root_mail_recipient => $root_mail_recipient,
  }

  class { 'postfix::mta':
    relayhost => $relayhost,
  }

  postfix::virtual {"@${valid_fqdn}":
    ensure      => present,
    destination => "root",
  }
}
