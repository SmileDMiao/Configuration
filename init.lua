-- 设置组合键
local hyper = {'ctrl', 'alt'}
local hypershift = {'shift', 'cmd'}
local hyperctrl = {'alt'}

-- 窗口: 最大化
hs.hotkey.bind(hypershift, 'up', function()
    local win = hs.window.focusedWindow()
    win:maximize(0)
end)

-- 窗口: 占满左半屏
hs.hotkey.bind(hypershift, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- 窗口: 沾满右半屏
hs.hotkey.bind(hypershift, "right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- 窗口: 移动到左边的屏幕
hs.hotkey.bind(hyper, 'left', function()
    local w = hs.window.focusedWindow()
    if not w then
        return
    end
    local s = w:screen():toWest()
    if s then
        w:moveToScreen(s)
    end
end)

-- 窗口: 移动到右边到屏幕
hs.hotkey.bind(hyper, 'right', function()
    local w = hs.window.focusedWindow()
    if not w then
        return
    end
    local s = w:screen():toEast()
    if s then
        w:moveToScreen(s)
    end
end)

-- 鼠标: 移动当前鼠标到下一个屏幕
-- focuses the other screen
local function focus_other_screen()
   local screen = hs.mouse.getCurrentScreen()
   local nextScreen = screen:next()
   local rect = nextScreen:fullFrame()
   local center = hs.geometry.rectMidPoint(rect)
   hs.mouse.setAbsolutePosition(center)
end

function get_window_under_mouse()
   local my_pos = hs.geometry.new(hs.mouse.getAbsolutePosition())
   local my_screen = hs.mouse.getCurrentScreen()
   return hs.fnutils.find(hs.window.orderedWindows(), function(w)
        return my_screen == w:screen() and my_pos:inside(w:frame())
   end)
end

function activate_other_screen()
   focus_other_screen()
   local win = get_window_under_mouse()
   win:focus()
end

-- move mouse cursor
hs.hotkey.bind(hyperctrl, "down", function()
    activate_other_screen()
end)
