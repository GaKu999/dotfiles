-- vim:ft=lua:noet:ts=3:sw=3:
-- man:swayimg(1)
-- file:$XDG_CONFIG_HOME/swayimg/init.lua
--------------------------------------------------------------------------------


swayimg.mode = "viewer"            -- mode at startup
swayimg.antialiasing = true        -- anti-aliasing
swayimg.decoration = true          -- window title/buttons/borders
swayimg.overlay = false            -- window overlay mode
swayimg.exif_orientation = true    -- image orientation by EXIF
swayimg.dnd_button = "MouseRight"  -- drag-and-drop mouse button


--------------------------------------------------------------------------------
--                       FORMAT SPECIFIC CONFIGURATION                        --
--------------------------------------------------------------------------------


swayimg.format_conf = {
	raw = {              -- "raw" image format settings
		enable = true,    -- enable RAW format decoder
		camera_wb = true  -- use camera white balance
	},
	ttf = {                     -- font preview settings
		enable = true,           -- enable font decoder
		text = "The quick brown fox jumps over the lazy dog 0123456789",
		color = 0xffd0d0d0,      -- font color
		background = 0xf21d2021  -- background color
	},
	video = {              -- storyboard from video files
		enable = true,      -- enable video storyboard
		size = 300,         -- size (width) of a single tile (frame)
		columns = 3,        -- number of columns in storyboard
		rows = 3,           -- number of rows in storyboard
		padding = 5,        -- gap between frames in pixels
		label = 0xffd0d0d0  -- label color in gallery mode
	},
}


--------------------------------------------------------------------------------
--                          IMAGE LIST CONFIGURATION                          --
--------------------------------------------------------------------------------


swayimg.imagelist.order = "numeric"        -- list order
swayimg.imagelist.reverse = false          -- reverse order
swayimg.imagelist.recursive = false        -- recursive directory reading
swayimg.imagelist.adjacent = false         -- add adjacent files from same dir
swayimg.imagelist.fsmon = true             -- enable file system monitoring


--------------------------------------------------------------------------------
--                         TEXT OVERLAY CONFIGURATION                         --
--------------------------------------------------------------------------------


swayimg.text.visible = false               -- overlay visible state
swayimg.text.font = "monospace"            -- font name
swayimg.text.size = 15                     -- font size in pixels
swayimg.text.spacing = 0                   -- line spacing
swayimg.text.padding = 4                   -- padding from window edge
swayimg.text.color = 0xffd0d0d0            -- text color
swayimg.text.background = 0xf21d2021       -- background color
swayimg.text.shadow = 0x0d000000           -- shadow color
swayimg.text.timeout = 3                   -- layer hide timeout
swayimg.text.status_timeout = 3            -- status message hide timeout


--------------------------------------------------------------------------------
--                             IMAGE VIEWER MODE                              --
--------------------------------------------------------------------------------


swayimg.viewer.default_scale = "optimal"   -- default image scale
swayimg.viewer.default_position = "center" -- default image position
swayimg.viewer.drag_button = "MouseLeft"   -- mouse button to drag image
swayimg.viewer.autocenter = true           -- enable automatic centering
swayimg.viewer.loop = true                 -- enable image list loop mode
swayimg.viewer.preload = 1                 -- number of images to preload
swayimg.viewer.history = 1                 -- number of images in history cache
swayimg.viewer.mark_color = 0xffb8bb26     -- mark icon color
swayimg.viewer.pinch_factor = 1.0          -- pinch gesture factor
swayimg.viewer.text = {                    -- text layer scheme
	topleft = {
		"File:\t{name}",
		"Format:\t{format}",
		"File size:\t{sizehr}",
		"File time:\t{time}",
		"EXIF date:\t{meta.Exif.Photo.DateTimeOriginal}",
		"EXIF camera:\t{meta.Exif.Image.Model}"
	},
	topright = {
		"Image:\t{list.index} of {list.total}",
		"Frame:\t{frame.index} of {frame.total}",
		"Size:\t{frame.width}x{frame.height}"
	},
	bottomleft = {
		"Scale:\t{scale}"
	}
}
swayimg.viewer.set_window_background(0xf21d2021) -- window background color
swayimg.viewer.set_image_chessboard(20, 0xff333333, 0xff4c4c4c) -- chessboard

-- exit from application
swayimg.viewer.on_key("q", function()
	swayimg.exit()
end)

-- switch to gallery mode
swayimg.viewer.on_key("g", function()
	swayimg.mode = "gallery"
end)
-- switch to slide show mode
swayimg.viewer.on_key("s", function()
	swayimg.mode = "slideshow"
end)

-- show/hide text overlay
swayimg.viewer.on_key("d", function()
	swayimg.text.visible = not swayimg.text.visible
end)

-- mark/unmark current image
swayimg.viewer.on_key("t", function()
	swayimg.viewer.mark_image()
end)

-- remove current image from the image list
swayimg.viewer.on_key("x", function()
	local img = swayimg.viewer.get_image()
	if img then
		swayimg.imagelist.remove(img.path)
	end
end)

-- toggle fullscreen
swayimg.viewer.on_key("f", function()
	swayimg.fullscreen = not swayimg.fullscreen
end)

-- toggle anti-aliasing
swayimg.viewer.on_key("a", function()
	swayimg.antialiasing = not swayimg.antialiasing
end)

-- rotate image
swayimg.viewer.on_key("Ctrl+]", function()
	swayimg.viewer.rotate(90)
end)
swayimg.viewer.on_key("Ctrl+[", function()
	swayimg.viewer.rotate(270)
end)

-- flip image
swayimg.viewer.on_key("m", function()
	swayimg.viewer.flip_vertical()
end)
swayimg.viewer.on_key("Shift+m", function()
	swayimg.viewer.flip_horizontal()
end)

-- zoom in/out
swayimg.viewer.on_key("i", function()
	swayimg.viewer.scale = swayimg.viewer.scale + swayimg.viewer.scale / 10
end)
swayimg.viewer.on_key("up", function()
	swayimg.viewer.scale = swayimg.viewer.scale + swayimg.viewer.scale / 10
end)
swayimg.viewer.on_key("equal", function()
	swayimg.viewer.scale = swayimg.viewer.scale + swayimg.viewer.scale / 10
end)
swayimg.viewer.on_key("o", function()
	swayimg.viewer.scale = swayimg.viewer.scale - swayimg.viewer.scale / 10
end)
swayimg.viewer.on_key("down", function()
	swayimg.viewer.scale = swayimg.viewer.scale - swayimg.viewer.scale / 10
end)
swayimg.viewer.on_key("minus", function()
	swayimg.viewer.scale = swayimg.viewer.scale - swayimg.viewer.scale / 10
end)
swayimg.viewer.on_key("z", function()
	swayimg.viewer.scale = 1
end)

-- reset scale/position
swayimg.viewer.on_key("r", function()
	swayimg.viewer.reset()
end)

-- move image across the window
swayimg.viewer.on_key("h", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x + 50, pos.y)
end)
swayimg.viewer.on_key("l", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x - 50, pos.y)
end)
swayimg.viewer.on_key("k", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x, pos.y + 50)
end)
swayimg.viewer.on_key("j", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x, pos.y - 50)
end)
swayimg.viewer.on_key("c", function()
	swayimg.viewer.set_fix_position("center")
end)

-- open next/previous image
swayimg.viewer.on_key("right", function()
	swayimg.viewer.open("next")
end)
swayimg.viewer.on_key("]", function()
	swayimg.viewer.open("next")
end)
swayimg.viewer.on_key("next", function()
	swayimg.viewer.open("next")
end)
swayimg.viewer.on_key("left", function()
	swayimg.viewer.open("prev")
end)
swayimg.viewer.on_key("[", function()
	swayimg.viewer.open("prev")
end)
swayimg.viewer.on_key("prior", function()
	swayimg.viewer.open("prev")
end)

-- stop animation and show next/previous frame
swayimg.viewer.on_key("period", function()
	swayimg.viewer.frame = swayimg.viewer.frame + 1
end)
swayimg.viewer.on_key("comma", function()
	local frame = swayimg.viewer.frame
	if frame > 0 then
		swayimg.viewer.frame = frame - 1
	end
end)

-- toggle animation
swayimg.viewer.on_key("space", function()
	swayimg.viewer.animation = not swayimg.viewer.animation
end)

-- move image across the window (mouse/touchpad)
swayimg.viewer.on_mouse("ScrollUp", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x, pos.y - 10)
end)
swayimg.viewer.on_mouse("ScrollDown", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x, pos.y + 10)
end)
swayimg.viewer.on_mouse("ScrollLeft", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x - 10, pos.y)
end)
swayimg.viewer.on_mouse("ScrollRight", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x + 10, pos.y)
end)

-- zoom in/out (mouse/touchpad)
swayimg.viewer.on_mouse("Ctrl+ScrollUp", function()
	local mouse = swayimg.get_mouse_pos()
	local scale = swayimg.viewer.scale
	swayimg.viewer.set_abs_scale(scale + scale / 10, mouse.x, mouse.y)
end)
swayimg.viewer.on_mouse("Ctrl+ScrollDown", function()
	local mouse = swayimg.get_mouse_pos()
	local scale = swayimg.viewer.scale
	swayimg.viewer.set_abs_scale(scale - scale / 10, mouse.x, mouse.y)
end)


--------------------------------------------------------------------------------
--                               SLIDESHOW MODE                               --
--------------------------------------------------------------------------------


swayimg.slideshow.timeout = 3                       -- timeout to switch image
swayimg.slideshow.default_scale = "fit"             -- default image scale
swayimg.slideshow.history = 0                       -- number of the history cache
swayimg.slideshow.text = { topleft = { "{name}" } } -- text layer scheme
swayimg.slideshow.set_window_background("auto")     -- window background mode

-- exit from application
swayimg.slideshow.on_key("q", function()
	swayimg.exit()
end)

-- switch to gallery mode
swayimg.slideshow.on_key("g", function()
	swayimg.mode = "gallery"
end)
-- switch to viewer mode
swayimg.slideshow.on_key("s", function()
	swayimg.mode = "viewer"
end)


--------------------------------------------------------------------------------
--                                GALLERY MODE                                --
--------------------------------------------------------------------------------


swayimg.gallery.thumb_size = 200              -- thumbnail size in pixels
swayimg.gallery.aspect = "fill"               -- thumbnail aspect ratio
swayimg.gallery.padding_size = 5              -- padding between thumbnails
swayimg.gallery.border_size = 5               -- border size for selected thumbnail
swayimg.gallery.border_color = 0xffebdbb2     -- border color for selected thumbnail
swayimg.gallery.selected_scale = 1.15         -- scale for selected thumbnail
swayimg.gallery.selected_color = 0xf2282828   -- background color for selected thumbnail
swayimg.gallery.unselected_color = 0xf21d2021 -- background color for unselected thumbnail
swayimg.gallery.window_color = 0xf21d2021     -- window background color
swayimg.gallery.pinch_factor = 100.0          -- pinch gesture factor
swayimg.gallery.hover = true                  -- enable mouse following
swayimg.gallery.cache = 100                   -- number of thumbnails stored in memory
swayimg.gallery.preload = false               -- preloading invisible thumbnails
swayimg.gallery.embedded_thumb = true         -- use embedded thumbnails
swayimg.gallery.pstore = false                -- enable persistent storage for thumbnails
swayimg.gallery.text = {                      -- text layer scheme
	topleft = {
		"File:\t{name}"
	},
	topright = {
		"{list.index} of {list.total}"
	}
}

-- exit from application
swayimg.gallery.on_key("q", function()
	swayimg.exit()
end)

-- switch to viewer mode
swayimg.gallery.on_key("g", function()
	swayimg.mode = "viewer"
end)
-- switch to slide show mode
swayimg.gallery.on_key("s", function()
	swayimg.mode = "slideshow"
end)

-- show/hide text overlay
swayimg.gallery.on_key("d", function()
	swayimg.text.visible = not swayimg.text.visible
end)

-- mark/unmark current image
swayimg.gallery.on_key("t", function()
	swayimg.gallery.mark_image()
end)

-- remove current image from the image list
swayimg.gallery.on_key("x", function()
	local img = swayimg.gallery.get_image()
	if img then
		swayimg.imagelist.remove(img.path)
	end
end)

-- toggle fullscreen
swayimg.gallery.on_key("f", function()
	swayimg.fullscreen = not swayimg.fullscreen
end)

-- toggle anti-aliasing
swayimg.gallery.on_key("a", function()
	swayimg.antialiasing = not swayimg.antialiasing
end)

-- thumbnail zoom in/out
swayimg.gallery.on_key("i", function()
	swayimg.gallery.thumb_size = swayimg.gallery.thumb_size + 10
end)
swayimg.gallery.on_key("up", function()
	swayimg.gallery.thumb_size = swayimg.gallery.thumb_size + 10
end)
swayimg.gallery.on_key("equal", function()
	swayimg.gallery.thumb_size = swayimg.gallery.thumb_size + 10
end)
swayimg.gallery.on_key("o", function()
	swayimg.gallery.thumb_size = swayimg.gallery.thumb_size - 10
end)
swayimg.gallery.on_key("down", function()
	swayimg.gallery.thumb_size = swayimg.gallery.thumb_size - 10
end)
swayimg.gallery.on_key("minus", function()
	swayimg.gallery.thumb_size = swayimg.gallery.thumb_size - 10
end)
swayimg.gallery.on_key("z", function()
	swayimg.gallery.thumb_size = 200
end)

-- select another thumbnail
swayimg.gallery.on_key("home", function()
	swayimg.gallery.select("first")
end)
swayimg.gallery.on_key("end", function()
	swayimg.gallery.select("last")
end)
swayimg.gallery.on_key("k", function()
	swayimg.gallery.select("up")
end)
swayimg.gallery.on_key("j", function()
	swayimg.gallery.select("down")
end)
swayimg.gallery.on_key("h", function()
	swayimg.gallery.select("left")
end)
swayimg.gallery.on_key("l", function()
	swayimg.gallery.select("right")
end)
swayimg.gallery.on_key("next", function()
	swayimg.gallery.select("pgdown")
end)
swayimg.gallery.on_key("prior", function()
	swayimg.gallery.select("pgup")
end)

-- select another thumbnail (mouse/touchpad)
swayimg.gallery.on_mouse("ScrollUp", function()
	swayimg.gallery.select("up")
end)
swayimg.gallery.on_mouse("ScrollDown", function()
	swayimg.gallery.select("down")
end)
swayimg.gallery.on_mouse("ScrollLeft", function()
	swayimg.gallery.select("left")
end)
swayimg.gallery.on_mouse("ScrollRight", function()
	swayimg.gallery.select("right")
end)

-- thumbnail zoom in/out (mouse/touchpad)
swayimg.gallery.on_mouse("Ctrl+ScrollUp", function()
	swayimg.gallery.thumb_size = swayimg.gallery.thumb_size + 10
end)
swayimg.gallery.on_mouse("Ctrl+ScrollDown", function()
	swayimg.gallery.thumb_size = swayimg.gallery.thumb_size - 10
end)


--------------------------------------------------------------------------------
--                                END OF FILE                                 --
--------------------------------------------------------------------------------
