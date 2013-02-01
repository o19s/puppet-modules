# jetty and solr install
# 2012 OpenSource Connections

package { 'java-1.7.0-openjdk':
	ensure => 'present'
}

package { 'jetty-solr':
	provider => 'rpm',
	source => 'http://uspto-yum-repo.s3-website-us-east-1.amazonaws.com/jetty-solr-4.1.0-9.el6.noarch.rpm',
	ensure => 'present',
	require => Package['java-1.7.0-openjdk']
}

service { 'jetty-solr':
	ensure => 'running',
	require => Package['jetty-solr']
}
