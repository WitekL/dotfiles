hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall

spoon.SpoonInstall:andUse("AppLauncher", {
  hotkeys = {
    c = "Google Chrome",
    t = "iTerm",
    s = "Slack",
    n = "Notion",
    z = "Zoom.us",
    m = "Spotify",
    f = "Finder",
    g = "Todoist",
    k = "Calendar"
  }
})

function setScreenLayout()
  screens = hs.screen.allScreens()
  x, y = screens[2]:position()

  if x == 1 and y == 0 then
    -- This one will set screens one above the other
    hs.execute('/usr/local/bin/displayplacer "id:9160F6E1-5FFE-3A97-55C2-AD8409159576 res:1920x1200 color_depth:8 scaling:on origin:(0,0) degree:0" "id:A630D395-ED5D-5071-8749-E5525B832A86 res:2560x1440 hz:60 color_depth:8 scaling:off origin:(-280,-1440) degree:0"')
  else
    -- This one will set screens next to each other
    hs.execute('/usr/local/bin/displayplacer "id:9160F6E1-5FFE-3A97-55C2-AD8409159576 res:1920x1200 color_depth:8 scaling:on origin:(0,0) degree:0" "id:A630D395-ED5D-5071-8749-E5525B832A86 res:2560x1440 hz:60 color_depth:8 scaling:off origin:(1920,-240) degree:0"')
  end
end

hs.hotkey.bind({"ctrl", "cmd"}, "'", setScreenLayout)
