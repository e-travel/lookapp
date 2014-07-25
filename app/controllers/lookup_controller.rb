class LookupController < ApplicationController

  before_filter { @dns_server_list = DNS_SERVERS }

  DNS_SERVERS = %w(
    208.67.222.222
    208.67.220.220
    8.8.8.8
    8.8.4.4
    127.0.0.1
  ).freeze

  def index
    render :action => :index
  end

  def create
    if params[:e_travel_host].present?
      dns = params[:e_travel_dns]
      cmd = "drill @#{dns} #{params[:e_travel_host]}"
      output = `#{cmd}`
      exit_status = $?.exitstatus.to_i

      if exit_status == 0
        @dns_response = output
      else
        flash.now[:error] = 'There was an error while performing the DNS lookup. Please check the logs or contact your system administrator.'
      end
    else
      flash.now[:error] = 'No host given.'
    end

    render :action => :index
  end
end
