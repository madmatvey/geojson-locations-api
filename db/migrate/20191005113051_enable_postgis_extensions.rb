class EnablePostgisExtensions < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def up
    execute <<-SQL.squish
      CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
      CREATE SCHEMA IF NOT EXISTS topology;
      CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;
      CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;
    SQL
  end

  def down
    # execute <<-SQL.squish
    #   DROP EXTENSION IF EXISTS postgis;
    #   DROP EXTENSION IF EXISTS postgis_topology;
    #   DROP EXTENSION IF EXISTS postgis_sfcgal;
    #   DROP SCHEMA topology;
    # SQL
  end
end
