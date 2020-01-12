# vim-wordcounter

## The Problem
Stephen Kings has claimed to write 2000 words a day. After reading this I wanted
to keep track of my word count statistics and my writing session times in an
automated manner. In that way I could see my improvement over time and adjust if
I felt that I was slowing down.

## The Solution
I use vim as my main editor. In priciple all the funtionality I wanted was
there. It was just a matter of construncting an automatted function to do what I
wanted.

## What does exactly this plugin do?
vim-wordcounter keeps track of the words you have written on any given buffer.
Every time you save a file it echoes a message with your current word count.
Additionallty, once you have left vim, it writes an additional file with the
`.stats` extension which contains the time you have started writting, the time
you left vim, the initial word count of the document and the words you wrote
during that session.

## How do I use it?
After you have installed it, the plugin works automatically with the files
ending in `_n.md`. No need of further configuration.

