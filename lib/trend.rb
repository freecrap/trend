require "date"
require "json"
require "net/http"
require "time"

require "trend/client"
require "trend/version"

module Trend
  class Error < StandardError; end

  def self.anomalies(*args)
    client.anomalies(*args)
  end

  def self.forecast(*args)
    client.forecast(*args)
  end

  def self.correlation(*args)
    client.correlation(*args)
  end

  def self.url
    @url ||= ENV["TREND_URL"] || "https://trendapi.org"
  end

  def self.url=(url)
    @url = url
    @client = nil
  end

  def self.api_key
    @api_key ||= ENV["TREND_API_KEY"]
  end

  def self.api_key=(api_key)
    @api_key = api_key
    @client = nil
  end

  # private
  def self.client
    @client ||= Client.new
  end
end
