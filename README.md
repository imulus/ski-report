ski-report
=============

A Ruby snow/ski report API wrapper

Requirements
------
ski-report uses the `xmlsimple` gem, so be sure to install that first.

	$ gem install xml-simple

Usage
------
  require './ski_report'

  SkiReport.fetch([state]) #=> returns a report with an array of resorts
  SkiReport.fetch 'Colorado'
  SkiReport.fetch 'California'  
  

Resort Methods
------
A resort has the following properties available as methods:
* name - name of the resort
* updated - when the report was last updated
* status - open status, e.g. 'Temporarily Closed'
* conditions - surface conditions, e.g. 'Packed Powder'
* base - a hash
  * :depth - snow depth at base
  * :metric - metric of base snow depth, e.g. 'inches'
* snowfall - a hash
  * :amount - snowfall in the last 48 hours
  * :metric - metric of 48hr snowfall, e.g. 'feet' 
  
Example
------
  report = SkiReport.fetch 'Colorado'
  report.resorts.each do |resort|
  	puts "#{resort.name} - Status: #{resort.status} - Base: #{resort.base[:depth]} #{resort.base[:metric]}"
  end

  # Arapahoe Basin - Status: Open - Base: 0 inches
  # Aspen / Snowmass - Status: Closed - Base: 0 inches
  # Beaver Creek - Status: Closed - Base: 0 inches
  # Breckenridge - Status: Closed - Base: 0 inches
  # Copper Mountain - Status: Closed - Base: 0 inches
  # Crested Butte - Status: Closed - Base: 0 inches
  # Durango - Status: Closed - Base: 0 inches
  # Echo - Status: Closed - Base: 0 inches
  # Eldora - Status: Closed - Base: 15 inches
  # Howelsen Hill - Status: Closed - Base: 0 inches
  # Keystone - Status: Closed - Base: 0 inches
  # Loveland - Status: Open - Base: 18 inches
  # Monarch - Status: Closed - Base: 0 inches
  # Powderhorn - Status: Closed - Base: 0 inches
  # Silverton - Status: Closed - Base: 0 inches
  # Ski Cooper - Status: Closed - Base: 0 inches
  # SolVista - Status: Closed - Base: 0 inches
  # Steamboat - Status: Closed - Base: 0 inches
  # Sunlight Mountain - Status: Closed - Base: 0 inches
  # Telluride - Status: Closed - Base: 0 inches
  # Vail - Status: Closed - Base: 0 inches
  # Winter Park - Status: Closed - Base: 0 inches
  # Wolf Creek - Status: Temporarily Closed - Base: 35 inches

Credit
------
This little library is using the [http://onthesnow.com/](http://onthesnow.com/) RSS for data.

License
-------

Copyright (C) 2011 by Imulus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.