# sequel-pg-locker

![](https://github.com/dylanegan/sequel-pg-locker/raw/master/sequel-pg-locker.jpg)

A simple way, using PostgreSQL, to has [semaphores](http://en.wikipedia.org/wiki/Semaphore_(programming\)).

Pulled from code by [Mark Fine](https://github.com/mfine).

## Usage

```ruby
➜  sequel-pg-locker git:(master) ✗ irb
1.9.3-p0 :001 > require 'sequel-pg-locker'
 => true
1.9.3-p0 :002 > ENV['DATABASE_URL'] = 'postgres://localhost/sequel_pg_locker_test'
 => "postgres://localhost/sequel_pg_locker_test"
1.9.3-p0 :003 > Sequel::PG::Locker.lock(12345)
 => true

➜  sequel-pg-locker git:(master) ✗ irb
1.9.3-p0 :001 > require 'sequel-pg-locker'
 => true
1.9.3-p0 :002 > ENV['DATABASE_URL'] = 'postgres://localhost/sequel_pg_locker_test'
 => "postgres://localhost/sequel_pg_locker_test"
1.9.3-p0 :003 > Sequel::PG::Locker.lock(12345)
 => false
1.9.3-p0 :004 > Sequel::PG::Locker.lock(12346)
 => true
```

## License

The MIT License (MIT)

Copyright © Heroku 2012

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
