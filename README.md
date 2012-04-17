# sequel-pg-locker

![](https://github.com/dylanegan/sequel-pg-locker/raw/master/sequel-pg-locker.jpg)

A simple way, using PostgreSQL, to has [semaphores](http://en.wikipedia.org/wiki/Semaphore_(programming)).

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
