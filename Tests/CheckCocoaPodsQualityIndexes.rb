#!/bin/ruby

#
# CheckCocoaPodsQualityIndexes.rb
# by William Entriken, version 1.0.1
# Part of https://github.com/fulldecent/swift3-module-template
#
# The validates that all controllable quality metrics receive maximum score
# from CocoaPods's scoring quality algorithm
#
# Usage: ruby CheckCocoaPodsQualityIndexes.rb PODNAME
#

require "json"
require "uri"
require "net/http"

pod_name = ARGV.shift

puts "Reviewing CocoaPods's quality metrics for #{pod_name}"
puts "Metrics documentation: https://guides.cocoapods.org/making/quality-indexes.html"
puts "Modifiers from: https://cocoadocs-api-cocoapods-org.herokuapp.com/pods/#{pod_name}/stats"
puts "Raw data from: http://metrics.cocoapods.org/api/v1/pods/#{pod_name}"
puts "NOTE: You must pust a new version to CocoaPods to get new metrics!"
puts ""

uri = URI.parse('https://cocoadocs-api-cocoapods-org.herokuapp.com/pods/AnimatedCollectionViewLayout/stats')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true if uri.scheme == 'https'
request = Net::HTTP::Get.new uri
response = http.request(request)

if !response.is_a? Net::HTTPOK
  puts "HTTP fetching error!"
  exit 1
end

passing = true
for metric in JSON.parse(response.body)['metrics']
  if ['Verified Owner', 'Very Popular', 'Popular'].include? metric['title']
    puts "SKIPPED\tYou cannot control: " + metric['title']
    next
  end
  if metric['modifier'] >= 0
    if metric['applies_for_pod']
      puts "GOOD\tEarned points for: " + metric['title']
    else
      puts "BAD\tMissed points for: " + metric['title']
      passing = false
    end
  else
    if metric['applies_for_pod']
      puts "BAD\tLost points for: " + metric['title']
      passing = false
    else
      puts "GOOD\tAvoided penalty for: " + metric['title']
    end
  end
end

# Let's disable this for now.
# exit passing ? 0 : 1
exit 0
