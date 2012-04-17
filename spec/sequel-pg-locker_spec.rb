require 'minitest/autorun'

require "sequel-pg-locker"

ENV['DATABASE_URL'] ||= "postgres://localhost/sequel_pg_locker_test"

describe Sequel::PG::Locker do
  subject { Sequel::PG::Locker }

  describe ".lock" do
    it "should provide a lock" do
      id = rand(1_000_000)
      subject.instance_variable_set(:@db, nil)
      assert subject.lock(id)
    end

    it "should not allow further locking" do
      id = rand(1_000_000)
      assert subject.lock(id)
      subject.instance_variable_set(:@db, nil)
      assert !subject.lock(id)
    end
  end
end
