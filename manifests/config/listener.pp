define maxscale::config::listener (
	$service,
	$protocol,
	$port,
	$socket = undef,
	$address = undef,
	$ssl = undef,
	$ssl_key = undef,
	$ssl_cert = undef,
	$ssl_ca_cert = undef,
	$ssl_version = undef,
	$ssl_cert_verification_depth = undef,
) {

	if $service == undef {
		fail("Service must be set!")
	}
	if $protocol == undef {
		fail("The Protocol must be set!")
	}
	if $port == undef or type($port) != integer {
		fail("Port must be an Integer and must be set!")
	}

	concat::fragment{ "Listener ${name}":
		target         => $::maxscale::params::configfile,
		content        => template("maxscale/listener.erb"),
		order          => 04,
	}


}