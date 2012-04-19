require "sequel"
require "timeout"
require "sequel-pg-locker/version"

module Sequel
  module PG
    module Locker
      # Public: Obtain a lock from PostgreSQL
      #
      # id - The Integer to get a lock of
      #
      # Examples
      #
      #   Sequel::PG::Locker.lock(12345)
      #   # => true
      #
      # Returns true if the lock is obtained or false if it is not.
      def self.lock(id)
        db["SELECT pg_try_advisory_lock(#{id})"].get
      end

      private

      # Internal: Provide the database connection
      #
      # Returns a Sequel::Database object
      def self.db
        @db ||= Sequel.connect(database_url)
      end

      # Internal: Proviate the database URL
      #
      # Returns a String of the database URL
      def self.database_url
        @database_url ||= ENV['DATABASE_URL']
      end
    end
  end
end
