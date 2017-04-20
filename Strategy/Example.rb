class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter)
    @title = 'Monthly Report'
    @text =  [ 'Things are going', 'really, really well.' ]
    @formatter = formatter
  end

  def output_report
    @formatter.call(self)
  end
end


HTML_FORMATTER = lambda do |context|
 puts('<html>')
 puts('  <head>')
 puts("    <title>#{context.title}</title>")
 puts('  </head>')
 puts('  <body>')
 context.text.each do |line|
   puts("    <p>#{line}</p>" )
 end
 puts('  </body>')
 puts('</html>')
end


PLAIN_TEXT_FORMATTER = lambda do |context|
  puts("***** #{context.title} *****")
  puts
  context.text.each do |line|
    puts(line)
  end
end


# Creates a new report and pass HTML_FORMATTER Proc as param
# report = Report.new &HTML_FORMATTER
# report.output_report

# Creates a new report and pass PLAIN_TEXT_FORMATTER Proc as param
report = Report.new &PLAIN_TEXT_FORMATTER
report.output_report
