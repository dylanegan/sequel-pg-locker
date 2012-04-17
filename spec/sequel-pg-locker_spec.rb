require 'minitest/autorun'

require "sequel-pg-locker"

LOCK_ID = rand(1_000_000)

describe Sequel::PG::Locker do
  subject { Sequel::PG::Locker }

  before do
    ENV['DATABASE_URL'] = "postgres://localhost/sequel_pg_locker_test"
  end

  describe ".lock" do
    before do
      subject.instance_variable_set(:@connection, nil)
    end

    it "should provide a lock" do
      assert subject.lock(LOCK_ID)
    end

    it "should not allow further locking" do
      subject.lock(LOCK_ID)
      assert !subject.lock(LOCK_ID)
    end
  end
end
