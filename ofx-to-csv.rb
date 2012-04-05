#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'ofx-parser'
require 'fastercsv'
require 'active_support/inflector'

ofx_file = ARGV.shift


unless ofx_file and File.exists?(ofx_file)
  puts "Usage: #{File.basename(__FILE__)} /path/to/statement.ofx"
  exit 1
end

# RBC does not specify the timezone string.
# Add it in
contents = File.read(ofx_file)
contents = contents.gsub('[-5]', '[-5:EST]')


ofx = OfxParser::OfxParser.parse(contents)


ofx.credit_cards.each do |credit_card|
  credit_card.statement.transactions.each do |transaction|
    date  = transaction.date.strftime('%Y-%m-%d')
    payee = ActiveSupport::Inflector.titleize(transaction.payee)
    memo  = ActiveSupport::Inflector.titleize(transaction.memo)
    type  = ActiveSupport::Inflector.titleize(transaction.type)
    puts [credit_card.number,date, transaction.fit_id, payee, -transaction.amount.to_f].to_csv
  end

end