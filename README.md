Common Lisp resource compilation
================================

This small demo shows how it is easy to compile a static resource (like web page template)
into a Common Lisp binary.

To run this example, you'll need [Roswell](https://github.com/roswell/roswell) and [Qlot](https://github.com/fukamachi/qlot) installed.
If you don't have these tools installed, then modify `build.sh` script to use plain SBCL and load Quicklisp client.

Here is an example of the output:

```
[art@art-osx:...loading-static-resources]% ./build.sh
; compiling file "/Users/art/projects/lisp/loading-static-resources/app.lisp" (written 15 JUN 2022 02:12:13 AM):

; wrote /Users/art/.cache/common-lisp/sbcl-2.2.4-macosx-arm64/Users/art/projects/lisp/loading-static-resources/app-tmpGHU3ALSV.fasl
; compilation finished in 0:00:00.004
compressed 65536 bytes into 1099 at level -1
compressed 65536 bytes into 684 at level -1
compressed 0 bytes into 8 at level -1
compressed 42991616 bytes into 10483586 at level -1

[art@art-osx:...loading-static-resources]% ./app
This is the content loaded from /Users/art/projects/lisp/loading-static-resources/resource.txt file:

Hello from statically linked resource!

I see original file still exists. Rename it or delete to check if content above comes from compiled binary.
```

Now we'll simulate a "production" environment where resource file is not accessible anymore:

```
[art@art-osx:...loading-static-resources]% mv resource.txt resource.txt.backup

[art@art-osx:...loading-static-resources]% ./app
This is the content loaded from /Users/art/projects/lisp/loading-static-resources/resource.txt file:

Hello from statically linked resource!

Original file does not exists anymore.
```
