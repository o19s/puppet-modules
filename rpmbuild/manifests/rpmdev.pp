user { 'makerpm':
	home => '/home/makerpm',
	shell => '/bin/bash',
	ensure => 'present',
	password => '*',
	comment => 'RPM packager',
	managehome => true,
	groups => 'mock',
	require => Group['mock']
}

group { 'mock':
	ensure => 'present',
}

# Puppet doesn't yet support yum groups with the package directive
# Until it does we use exec to install these packages. 
exec { 'install dev tools':
	unless  => '/usr/bin/yum grouplist "Development tools" | /bin/grep "^Installed Groups"',
	command => '/usr/bin/yum -y groupinstall "Development tools"',
}

package { 'rpm-build':
	ensure => 'present',
	require => Exec['install dev tools']
}
