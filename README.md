[![Gem Version](https://badge.fury.io/rb/mingle_cli.png)](http://badge.fury.io/rb/mingle_cli)
[![Build Status](https://travis-ci.org/ike18t/mingle_cli.png?branch=master)](https://travis-ci.org/ike18t/mingle_cli)
[![Code Climate](https://codeclimate.com/github/ike18t/mingle_cli.png)](https://codeclimate.com/github/ike18t/mingle_cli)
[![Coverage Status](https://coveralls.io/repos/ike18t/mingle_cli/badge.png?branch=master)](https://coveralls.io/r/ike18t/mingle_cli?branch=master)
[![Dependency Status](https://gemnasium.com/ike18t/mingle_cli.png)](https://gemnasium.com/ike18t/mingle_cli)

## MingleCLI
MingleCLI is a command line interface to the Mingle API.  Currently the application is a read-only view of card(s) information.

#Configuring
```
mingle_cli.rb configure --username=[username] --password=[password] --hostname=[hostname] --project=[project]
```

#Usage


```
mingle_cli.rb card [number] [format]
```

```
mingle_cli.rb cards [filter] [format]
```

```
mingle_cli.rb comments [number]
```

###Argument Definitions:###
* __Number__: The card number.
* __Format__: The format of the result of the command.  Formats can contain property names nested in brackets which will then be replaced with the value of the property.
* __Filter__: Mingle's MQL syntax.


#Examples
####Configuring:####

```
mingle_cli.rb configure --username=hsimpson --password=doh1 --hostname=power_plant.local --project=radioactive_donut
```
####Getting card information:####

```
mingle_cli.rb card 19480 "Status: [status] Pair: [dev pair]"
```

```
Status: In Development Pair: Homer/Bart
```
####Querying for cards:####

```
mingle_cli.rb cards 'status is ["in development"]' 'Number: [number] Pair: [dev pair]'
```

```
Number: 19480 Pair: Homer/Bart
Number: 19495 Pair: Marge/Lisa
```
####Viewing card comments:####

```
mingle_cli.rb comments 19480
```

```
2014-01-30 12:57:46 -0500 Home Simpson: Doh!
```