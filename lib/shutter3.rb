#!/usr/bin/env ruby

# file: shutter3.rb

# description: Uses the command `hcidump --raw` to detect the bluetooth 
#              button events for a wireless bluetooth remote control
#              shutter button.

# see also: https://github.com/kinnalru/bluebutton

#note: To use hcidump, `apt-get install bluez-hcidump`. 


class Shutter3

  def initialize(bdid='', debug: false)
    @bdid = bdid.split(':').reverse.join(' ')
    @debug = debug
  end

  def start()

    button = nil
    found = 0

    IO.popen('sudo hcidump --raw').each_line do |x| 

      case x
      when /#{@bdid}/

        found += 1

        if found > 2 then
          on_connect()
          next
        end
      when /> 04 05 04 00 40 00 08 \n/
        on_disconnect()
        next
      end

      case x[/> 02 40 20 09 00 05 00 04 00 1B (\w+ \w+ \w+ \w+)(?= \n$)/,1]
      when "17 00 00 28"
        on_android_keydown()
        on_android_keypress()
        button = :android
      when "17 00 00 00"
        on_android_keyup()
        button = nil
      when "13 00 01 00"
        next if button == :android
        on_ios_keydown()
        on_ios_keypress()
      when "13 00 00 00"
        next if button == :android
        on_ios_keyup()
      when ""
      end
      puts x.inspect if @debug
    end

  end

  protected

  def on_android_keypress()
    puts 'android button pressed'
  end

  def on_android_keydown()
  end

  def on_android_keyup()
  end

  def on_connect()
    puts 'connected to ' + @bdid
  end

  def on_disconnect()
    puts @bdid + ' disconnected'
  end

  def on_ios_keypress()
    puts 'iOS button pressed'
  end

  def on_ios_keydown()
  end

  def on_ios_keyup()
  end

end

