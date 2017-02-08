#class Optparser
#  CODES = %w(iso-2022-jp shift_jis euc-jp utf8 binary).freeze
#  CODE_ALIASES = { 'jis' => 'iso-2022-jp', 'sjis' => 'shift_jis' }.freeze
#
#  def self.parse
#    options = OpenStruct.new
#    options.apk = '*.apk' # visi kas ir apk faili
#    options.tags = '--tags ~@wip' # visi test keisi kas ir pabeigti
#    options.report = 'html'
#
#    opt_parser = OptionParser.new do |opts|
#      opts.banner = 'Usage:ruby main.rb [options]'
#
#      opts.separator ''
#      opts.separator = 'Specific options:'
#
#      opts.on('-a', '--apk [app.apk]',
#              'app .apk file, default *.apk') do |apk|
#        options.apk = apk
#      end
#
#      options.on('-t', '--tags',
#                'Tags which tests should execute (@test), default ~@wip') do |t|
#        tags = ''
#        t.split('.').each do |temp_tag|
#          tags = tags + '--tags' + temp_tag + ' '
#        end
#        options.tags = tags
#      end
#
#      opts.on('-r', '--report [html]',
#              'Report file format, default html') do |report|
#                options.report = report
#              end
#
#      opts.on_tail('-h', '--help', 'Show this message') do
#        puts opts
#        exit
#      end
#
#    end
#  end
#end
