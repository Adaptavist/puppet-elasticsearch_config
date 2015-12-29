# = Class: elasticsearch_config
#

class elasticsearch_config(
        $package_url  = undef,
        $ensure       = 'present',
        $status       = 'running',
        $es_version   = '1.4.2',
        $repo_version = '1.4',
        $config = {
            'network' => '127.0.0.1'
            },
        $instances = {},
        $templates = {},
    ) {

    if ($package_url and $package_url != 'false') {
        $manage_repo = false
        $real_package_url = $package_url
    } else {
        $manage_repo = true
        $real_package_url = undef
    }

    include oracle_java

    class {'elasticsearch' :
        ensure       => $ensure,
        package_url  => $real_package_url,
        version      => $es_version,
        manage_repo  => $manage_repo,
        repo_version => $repo_version,
        status       => $status,
        config       => $config,
    }

    create_resources('elasticsearch::template',  $templates)
    create_resources('elasticsearch::instance',  $instances)
}