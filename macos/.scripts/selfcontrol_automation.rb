require 'time'

end_time = Time.now + (60*60*8)

`/Users/witek/Applications/SelfControl.app/Contents/MacOS/selfcontrol-cli start --blocklist /Users/witek/.scripts/blocklist.selfcontrol --enddate #{end_time.utc.iso8601}`
