#require 'capistrano/extensions'
require 'capistrano/logger'
require 'capistrano/utils'

require 'capistrano/configuration/connections'
require 'capistrano/configuration/execution'
require 'capistrano/configuration/loading'
require 'capistrano/configuration/namespaces'
require 'capistrano/configuration/roles'
require 'capistrano/configuration/variables'

require 'capistrano/configuration/actions/file_transfer'
require 'capistrano/configuration/actions/inspect'
require 'capistrano/configuration/actions/invocation'

module Capistrano
  # Represents a specific Capistrano configuration. A Configuration instance
  # may be used to load multiple recipe files, define and describe tasks,
  # define roles, and set configuration variables.
  class Configuration
    # The logger instance defined for this configuration.
    attr_reader :logger

    def initialize #:nodoc:
      @logger = Logger.new
    end

    # The includes must come at the bottom, since they may redefine methods
    # defined in the base class.
    include Connections, Execution, Loading, Namespaces, Roles, Variables

    # Mix in the actions
    include Actions::FileTransfer, Actions::Inspect, Actions::Invocation
  end
end
