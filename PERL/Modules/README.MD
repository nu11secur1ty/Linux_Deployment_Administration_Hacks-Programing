# Perl modules
![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks-Programing/blob/master/PERL/Modules/logo/Perl-Module.png)

- Find your `#INC` module directory of Perl
```bash
perl -V
```
# Create the module in my case, the @INC is in `/usr/share/perl/5.26`
- Create your module, in my case, the module will take the information for the current time from [NTP](https://en.wikipedia.org/wiki/Network_Time_Protocol).
```bash
cd /usr/share/perl/5.26
vim FileLogger.pm
```
- add to FileLogger.pm
```perl 
package FileLogger;
# FileLogger.pm
# From www.perltutorial.org/Distribution by @nu11secur1ty

use strict;
use warnings;
 
my $LEVEL = 1; # default log level
 
sub open{
   my $logfile = shift;
   # open log file for appending
   open(LFH, '>>', $logfile) or die "cannot open the log file $logfile: $!";
   # write logged time:
   print LFH "Time: ", scalar(localtime), "\n";
}
 
sub log{
   my($log_level,$log_msg) = @_;
   # append log if the passed log level is lower than
   # the module log level
   if($log_level <= $LEVEL){
      print LFH "$log_msg\n";
   }
}
 
sub close{
   close LFH;
}
 
sub set_level{
   # set the log level
   my $log_level = shift;
   # check if the passed log level is a number
   if($log_level =~ /^\d+$/){
      $LEVEL = $log_level;
   }
}
 
1;
```
- Create an app which will collect the log from the current time and will use your new module.
```perl
#!/usr/bin/perl
use strict;
use warnings;
 
use FileLogger;
 
FileLogger::open("logtest.log");
 
FileLogger::log(1,"This is a test message");
 
FileLogger::close();
```

- Read more: `https://www.perltutorial.org/`
# Good luck ;)
