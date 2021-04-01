This repository contains a project demonstrating a weird issue when drawing `extraLineFragmentRect`
in `NSLayoutManager.drawBackground(forGlyphRange:at:)`.

As you can see from [this video](https://youtu.be/CKpns9oQqOI) the extra line's rect is being clipped
for some lines. The size of the rect is okay, as you can see from the console output, but the visual
representation is not correct.

What's interesting is that the problematic lines are some kind of borderlines, meaning that if you add
new lines after them, `drawBackground` method starts getting called 1 time more than on the previous line.
So, in the video above:

| Broken | Line | Number of `drawBackground` calls |
|--------|------|----------------------------------|
|        | 1    | 1                                |
|        | ...  | ...                              |
|        | 5    | 1                                |
| ❌     | 6    | 1                                |
|        | 7    | 2                                |
|        | ...  | ...                              |
|        | 12   | 2                                |
| ❌     | 13   | 2                                |
|        | 14   | 3                                |
|        | ...  | ...                              |