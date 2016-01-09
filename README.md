# servicereporter

## To Do
* Error Control servicenow.rb
* ServiceNow update set


#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with servicereport](#setup)
    * [What servicereport affects](#what-servicereport-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with servicereport](#beginning-with-servicereport)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Start with a one- or two-sentence summary of what the module does and/or what
problem it solves. This is your 30-second elevator pitch for your module.
Consider including OS/Puppet version it works with.

You can give more descriptive information in a second paragraph. This paragraph
should answer the questions: "What does this module *do*?" and "Why would I use
it?" If your module has a range of functionality (installation, configuration,
management, etc.), this is the time to mention it.

## Setup


class {'servicenowreporter':
  servicenow_username => 'user',
  servicenow_password => 'password',
  servicenow_instance => 'https://instance.service-now.com',
}

It is also possible to post the results to a different webservice. Use the servicenow_webservice variable to set the webservice.

### Servicenowreporter class ###
#### servicenow_username ####
#### servicenow_password ####
#### servicenow_instance ####
#### servicenow_webservice ####
Default value is ```/api/now/import/u_service_puppet_changes```. Change if nescecary.
#### puppet_config_dir ####
Default value is /etc/puppetlabs/puppet/. For PE. Change to other directory for puppet open source.

### Dependencies / Gems ###
* Faraday

## Limitations

The class uses the puppet-gem provider which is only available from puppet 4.0

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.
