// try: amm -w ~/src/yaz/yazilimcik/say.kojo

val predef = "~/.ammonite/predef.sc"
println("\nIn my predef file: " + predef)

// Don't code here. Try the following instead which is sourced below:
//   ~/src/script/sample.sc

interp.load.ivy(
  "com.lihaoyi" %
  s"ammonite-shell_${scala.util.Properties.versionNumberString}" %
  ammonite.Constants.version
)
@
val shellSession = ammonite.shell.ShellSession()
import shellSession._
import ammonite.ops._
import ammonite.shell._
ammonite.shell.Configure(interp, repl, wd)

// note: $file v $exec -- http://ammonite.io/#CannotdirectlyimportfrominsideaScript
import $exec.src.script.box
import $exec.src.script.mmath

// at the end:
import $file.src.script.now

import $exec.src.script.sample

//import $file.src.script.fizzbuzz
//import $file.src.script.printMessages
import $exec.src.script.fileIO

println("\nEnd of predef file.\n")
println("hey")
