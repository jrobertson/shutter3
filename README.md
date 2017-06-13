# Introducing the Shutter3 gem

![Photo of a bluetooth remote control camera shutter](http://www.jamesrobertson.eu/r/images/2017/jun/13/shutter3.png)

## Installation

* `apt-get install bluez-hcidump`
* `gem install shutter3`

## Usage

    require 'shutter3'

    shutter = Shutter3.new('FF:FF:EF:FE:E0:3A')
    shutter.start

Output:

<pre>
connected to 3A E0 FE EF FF FF
iOS button pressed
android button pressed
3A E0 FE EF FF FF disconnected
</pre>

### Example using a custom class

    class BluetoothRemote < Shutter3

      def initialize(bdid)
        super(bdid)
      end

      def on_android_keypress()
        puts 'button 2 pressed'
      end

      def on_android_keydown()

      end

      def on_android_keyup()

      end

      def on_connect()
        puts 'the bluetooth remote is now connected'
      end

      def on_disconnect()
        puts 'the bluetooth remote is now disconnected'
      end

      def on_ios_keypress()
        puts 'button 1 pressed'
      end

      def on_ios_keydown()

      end

      def on_ios_keyup()

      end

    end

    br = BluetoothRemote.new 'FF:FF:EF:FE:E0:3A'
    br.start


Output:

<pre>
the bluetooth remote is now connected
button 1 pressed
button 2 pressed
the bluetooth remote is now disconnected
</pre>


## Resources

* shutter3 https://rubygems.org/gems/shutter3

bluetooth shutter control button remote

