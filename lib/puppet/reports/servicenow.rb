# encoding: UTF-8
require 'puppet'
require 'yaml'
require 'faraday'

Puppet::Reports.register_report(:servicenow) do
  desc <<-DESC
  Send Puppet report abstraction to servicenow for further processing.
  DESC

  @configfile = File.join(File.dirname(Puppet.settings[:config]), 'servicenowrepoter.yml')
  raise(Puppet::ParseError, "Servicenow report config file #{@configfile} not readable") unless File.exist?(@configfile)

  @config = YAML.load_file(@configfile)
  SN_INSTANCE = @config['servicenow']['instance']
  SN_USER = @config['servicenow']['user']
  SN_WEBSERVICE = @config['servicenow']['webservice']
  SN_PASS = @config['servicenow']['password']

  def process
    Puppet.info "Sending status for #{host} to ServiceNow."
    conn = Faraday.new(url: SN_INSTANCE, ssl: { verify: false }) do |faraday|
      faraday.request :url_encoded
      # TODO: changed interpoliation to to string convertion. Need to test if it works.
      faraday.basic_auth(SN_USER, SN_PASS)
      faraday.adapter Faraday.default_adapter
    end
    # TODO: need to wrap post in catch try for error control.
    conn.post do |req|
      req.url SN_WEBSERVICE
      req.headers['Content-Type'] = 'application/json'
      req.body = "{'u_configuration_version':'#{configuration_version}','u_environment':'#{environment}','u_host':'#{host}','u_status':'#{status}'}"
    end
    # TODO: Need to check for 200 return otherwise log error.
  end
end
