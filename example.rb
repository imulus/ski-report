require './ski_report'

report = SkiReport.fetch 'Colorado'
report.resorts.each do |resort|
	puts "#{resort.name} - Status: #{resort.status} - Base: #{resort.base[:depth]} #{resort.base[:metric]}"
end