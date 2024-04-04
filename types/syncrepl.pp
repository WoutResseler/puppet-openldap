# @summary Parameters for database replication consumers
#
# @see https://www.openldap.org/doc/admin24/slapdconfig.html#syncrepl
type Openldap::Syncrepl = Struct[
  {
    rid                        => Variant[Integer[0, 999], Pattern['\A\d{1,3}\z']],
    provider                   => Pattern['\Aldaps?://[^/:]+(:\d+)?\z'],
    searchbase                 => String[1],
    Optional['type']           => Enum['refreshOnly', 'refreshAndPersist'],
    Optional[interval]         => Pattern['\A\d{2}:\d{2}:\d{2}:\d{2}\z'],
    Optional[retry]            => String[1],
    Optional[filter]           => String[1],
    Optional[scope]            => Enum['sub', 'one','base'],
    Optional[attrs]            => String[1],
    Optional[exattrs]          => String[1],
    Optional[attrsonly]        => Boolean,
    Optional[sizelimit]        => Integer[0],
    Optional[timelimit]        => Integer[0],
    Optional[schemachecking]   => Enum['on', 'off'],
    Optional[network-timeout]  => Integer[0],
    Optional[timeout]          => Integer[0],
    Optional[updatedn]         => String[1],
    Optional[bindmethod]       => Enum['simple', 'sasl'],
    Optional[binddn]           => String[1],
    Optional[saslmech]         => String[1],
    Optional[authcid]          => String[1],
    Optional[authzid]          => String[1],
    Optional[credentials]      => Variant[String[1], Sensitive[String[1]]],
    Optional[realm]            => String[1],
    Optional[secprops]         => String[1],
    Optional[keepalive]        => Pattern['\A\d{2}:\d{2}:\d{2}\z'],
    Optional[starttls]         => Enum['yes', 'critical'],
    Optional[tls_cert]         => Stdlib::Absolutepath,
    Optional[tls_key]          => Stdlib::Absolutepath,
    Optional[tls_cacert]       => Stdlib::Absolutepath,
    Optional[tls_cacertdir]    => Stdlib::Absolutepath,
    Optional[tls_reqcert]      => Enum['never', 'allow', 'try', 'demand'],
    Optional[tls_cipher_suite] => String[1],
    Optional[tls_crlcheck]     => Enum['none', 'peer', 'all'],
    Optional[tls_protocol_min] => Pattern['\A\d+(\.\d+)?\z'],
    Optional[suffixmassage]    => String[1],
    Optional[logbase]          => String[1],
    Optional[logfilter]        => String[1],
    Optional[syncdata]         => Enum['default', 'accesslog', 'changelog'],
  }
]
