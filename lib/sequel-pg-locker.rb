require "sequel"
require "timeout"
require "sequel-pg-locker/version"

module Sequel
  module PG
    module Locker
      def self.lock(id)
        Timeout.timeout(3) { connection["SELECT pg_try_advisory_lock(#{id})"].get }
      end

      private

      def self.connection
        @connection ||= Sequel.connect(ENV['DATABASE_URL'], encoding: "unicode") do |conn|
          conn.run("SET synchronous_commit TO 'off'")
          conn
        end
      end
    end
  end
end
