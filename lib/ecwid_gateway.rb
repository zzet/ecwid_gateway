require "ecwid_gateway/version"

module EcwidGateway

  autoload :Client, "ecwid_gateway/client"
  autoload :Config, "ecwid_gateway/config"

  extend Config
end
