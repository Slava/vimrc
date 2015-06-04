I use Vim as my main text editor. The main use-cases are:

- Work-related coding and notes. Usually I work on the same code base for a long
  time, sometimes I switch between different projects.
- Personal temporary notes, writings, email drafts, etc.
- Long-term notes organized by folders.

Vim uses buffers as the smallest unit of an opened file. The same buffer can be
open in several tabs or splits.

I usually keep one Vim window open for all my work, personal and non-personal
and even temporary files.

Every tab is used as a separate work-space where I keep all splits and buffers
related to one project or folder. Using Vim commands or plugins, it is easy to
give each tab a permanent name and just reuse this tab only for the work related
to that folder or purpose.

Usually I would keep one tab that keeps all personal and temporary notes located
at `~/Dropbox/md/` (a bunch of markdown files).

Another tab for my main work, usually `~/work/meteor`.

And every other tab for other projects or temp activities: `~/work/meteor-bla`,
`~/work/decaf`, `/usr/include/c++/some-random-file.h`, etc.

Now, I can leave a work-space if I am not working on that task and focus my
attention on one project. But I know that I take notes often, or I need to draft
something during lunch break, or write a well-formatted response for a forum
thread. For such purposes I can quickly open the first tab with notes and
finish an errand.

When I am debugging a problem and I need to open a log file from a random
folder, I can do it by running `open -A MacVim crash.log` in my terminal and it
will open the log file in a separate tab in my main Vim application. After I am
done looking at it, I can close it.

While focusing on one task, I have 2 shortcuts:

- Ctrl+N to open a new file
- Ctrl+P to switch to a buffer that is already open related to this workspace

The first one is common but takes longer to filter down, because it shows all
thousands of files in the project. The second one is faster to use, if I know
that the file is already open (I can remember if I am working on 4 files at the
same time).

The first shortcut has another version that looks into nested directories from
the start. Ideally, I would bind it to Ctrl+Shift+N but since Vim doesn't work
on such chords, I bound it to Ctrl+Space which is another common combination.
This shortcut works similar to Sublime Text's pallete.

Lastly, if I want to run a command by name or switch tabs by name or open a
buffer from the global buffers list, I can do it by running one of the leader
shortcuts: `<leader>j`, `<leader>t`, `<leader>b`.

In the end, setting up this layout can take some time (a minute) so using
something like `vim-session` is great to autosave and autoload the session just
like you would expect in Chrome or Sublime Text.

