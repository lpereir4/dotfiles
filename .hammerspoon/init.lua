application = require "hs.application"
hotkey = require "hs.hotkey"
window = require "hs.window"
fnutils = require "hs.fnutils"
screen = require "hs.screen"
grid = require "hs.grid"

--
-- Controls Modifiers
-- {alt, shift}         => size control
-- {alt, cmd, shift}  => super size control
-- {cmd, ctrl}        => position control
--
-- size_control = {"alt", "shift"}
-- super_size_control = {"alt", "cmd", "shift"}
-- position_control = {"ctrl", "alt"}

--
-- Maximize
--
assert(window.focusedWindow)
hs.hotkey.bind({"alt"}, "m", function ()
        window.focusedWindow() : maximize()
        print "Maximisation of focused window."
end, nil, nil)

hotkey.bind({"alt"}, "n", function ()
        grid.snap(window.focusedWindow())
end, nil, nil)

--
-- Move a window to the previous/next screen
--
assert(grid.pushWindowNextScreen)
assert(grid.pushWindowPrevScreen)
hotkey.bind({"cmd", "alt", "ctrl"}, "right", grid.pushWindowNextScreen, nil, nil)
hotkey.bind({"cmd", "alt", "ctrl"}, "left", grid.pushWindowPrevScreen, nil, nil)

--
-- Windows position control
--
assert(grid.pushWindowUp)
assert(grid.pushWindowDown)
assert(grid.pushWindowLeft)
assert(grid.pushWindowRight)
hotkey.bind({"ctrl", "alt"}, "up", grid.pushWindowUp, nil, nil)
hotkey.bind({"ctrl", "alt"}, "down", grid.pushWindowDown, nil, nil)
hotkey.bind({"ctrl", "alt"}, "left", grid.pushWindowLeft, nil, nil)
hotkey.bind({"ctrl", "alt"}, "right", grid.pushWindowRight, nil, nil)

--
-- Windows size control
--
assert(grid.resizeWindowShorter)
assert(grid.resizeWindowTaller)
assert(grid.resizeWindowThinner)
assert(grid.resizeWindowWider)
hotkey.bind({"alt", "shift"}, "up", grid.resizeWindowShorter)
hotkey.bind({"alt", "shift"}, "down", grid.resizeWindowTaller)
hotkey.bind({"alt", "shift"}, "left", grid.resizeWindowThinner)
hotkey.bind({"alt", "shift"}, "right", grid.resizeWindowWider)

assert(grid.pushWindowLeft)
assert(grid.pushWindowUp)
assert(grid.pushWindowRight)
assert(grid.pushWindowDown)
assert(grid.resizeWindowTaller)
assert(grid.resizeWindowWider)
assert(grid.resizeWindowShorter)
assert(grid.resizeWindowThinner)
assert(grid.snap)
assert(grid.pushWindowUp)
assert(window.focusedWindow)
hotkey.bind({"alt", "cmd", "shift"}, "left", function ()
        grid.pushWindowLeft()
        grid.snap(window.focusedWindow())
end, nil, nil)

hotkey.bind({"alt", "cmd", "shift"}, "right", function ()
        grid.pushWindowRight()
        grid.snap(window.focusedWindow())
end, nil, nil)

hotkey.bind({"alt", "cmd", "shift"}, "up", function ()
        grid.pushWindowUp()
        grid.snap(window.focusedWindow())
end, nil, nil)

hotkey.bind({"alt", "cmd", "shift"}, "down", function ()
        grid.pushWindowDown()
        grid.snap(window.focusedWindow())
end, nil, nil)

grid.GRIDHEIGHT = 3
grid.GRIDWIDTH = 3
grid.MARGINX = 2
grid.MARGINY = 2
