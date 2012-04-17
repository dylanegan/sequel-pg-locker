require "sequel"
require "timeout"
require "sequel-pg-locker/version"

module Sequel
  module PG
    module Locker
      def self.lock(id)
        db["SELECT pg_try_advisory_lock(#{id})"].get
      end

      private

      def self.db
        @db ||= Sequel.connect(database_url)
      end

      def self.database_url
        @database_url ||= ENV['DATABASE_URL']
      end
    end
  end
end
