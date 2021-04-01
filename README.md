This repository contains a project demonstrating a weird issue when drawing `extraLineFragmentRect`
in `NSLayoutManager.drawBackground(forGlyphRange:at:)`.

As you can see from [this video](https://youtu.be/CKpns9oQqOI) the extra line's rect is being clipped
for some lines. The size of the rect is okay, as you can see from the console output, but the visual
representation is not correct.