#!/usr/bin/ruby

require 'soap/wsdlDriver'

WSDL_URL = "http://www.webservicex.net/CurrencyConvertor.asmx?WSDL"

soap = SOAP::WSDLDriverFactory.new(WSDL_URL).create_rpc_driver
# soap.wiredump_dev = STDOUT
result = soap.ConversionRate(:FromCurrency => "USD", :ToCurrency => 
"CAD")

puts result.conversionRateResult
