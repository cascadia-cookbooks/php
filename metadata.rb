name                'cop_php'
description         'Configures PHP7 and installs PHP7 plus associated packages.'
long_description    IO.read(File.join(File.dirname(__FILE__), 'README.md'))
license             'MIT'
maintainer          'Copious, Inc.'
maintainer_email    'engineering@copiousinc.com'
version             '0.5.3'
source_url          'https://github.com/copious-cookbooks/php'
issues_url          'https://github.com/copious-cookbooks/php/issues'

supports 'ubuntu', '>= 16.04'
supports 'ubuntu', '= 14.04'
supports 'centos', '= 7.2'

depends 'apt'
