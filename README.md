# Jump for Windows
Easily jump around the file system by manually adding marks.

It's like the [Oh My Zsh jump plugin](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/jump/jump.plugin.zsh), but for Windows.

## Installation
Copy all the .bat files in any directory listed in your [`%PATH%`](https://en.wikipedia.org/wiki/PATH_(variable)#DOS.2C_OS.2F2.2C_and_Windows).

## Usage

### Mark the current path for recurrent use
```
mark foo
```
Example :
```
C:\Program Files>mark prog
C:\Program Files>_
```

### Jump to a marked path
```
jump foo
```
Example :
```
C:\Program Files>cd ..
C:\>jump prog
C:\Program Files>_
```

### List all created marks
```
marks
```
Example :
```
C:\Program Files>marks
prog -> C:\Program Files

C:\Program Files>_
```

### Remove a mark
```
unmark foo
```
Example :
```
C:\Program Files>unmark prog
C:\Program Files>_
```

### Keep a path for later user
```
keep
```
Example :
```
C:\Users\Username>keep
```

### Jump back to the keeped path
```
back
```
Example :
```
C:\Users\Username>cd \
C:\>back
C:\Users\Username>_
```

## Notes
If you `mark` a path without giving a name, the mark name with be the folder name :
```
C:\bar>mark
C:\bar>cd ..
C:\>jump bar
C:\bar>_
```
When a path is no more available, `marks` will tell you :
```
C:\bar>mark foo
C:\bar>cd ..
C:\>rmdir C:\bar
C:\>marks
bar -> ?

C:\>_
```
`mark` will ask for a confirmation if you're trying to override any existing mark name :
```
C:\>marks
home -> C:\Users\Username

C:\>mark home
Mark C:\ as home? (y/n) _
```
Marks are stored in the directory `%MARKPATH%`, which defaults to `%HOME%\.marks`. If `%HOME%` is not [set](http://www.computerhope.com/issues/ch000549.htm), it defaults to [`%USERPROFILE%\.marks`](https://en.wikipedia.org/wiki/Home_directory#Default_home_directory_per_operating_system).