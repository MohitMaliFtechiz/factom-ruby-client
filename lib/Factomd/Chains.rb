require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class Chains

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def chainHead(chainid)
    return @h.call("chain-head",{"chainid": chainid})
  end

  def commitChain(message)
    return @h.call("commit-chain",{"message": message})
  end

  def commitEntry(message)
    return @h.call("commit-entry",{"message": message})
  end

  def currentMinute()
    return @h.call("current-minute",{})
  end

  def revealChain(entry)
    return @h.call("reveal-chain",{"entry": entry})
  end

  def revealEntry(entry)
    return @h.call("reveal-entry",{"entry": entry})
  end

  def sendRawMessage(message)
    return @h.call("send-raw-message",{"message": message})
  end
end