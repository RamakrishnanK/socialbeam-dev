Before Bundle Install
=====================
#Before bundle install
1. jRuby 1.6.8 : rvm install jruby-1.6.8
2. rvm use jruby-1.6.8
3. Rails 3.2.11 : jruby -S gem install rails -v='3.2.11' --no-ri --no-rdoc
4. JDBC-MySQL : jruby -S gem install jdbc-mysql activerecord-jdbcmysql-adapter
5. Install Neo4J Server and Executables,Start: rake neo4j:install rake neo4j:start

Commands for Neo4j
==================
rake neo4j:install                           # Install Neo4j to the neo4j directory under your project
rake neo4j:install[community,1.6.M03]        # Install Neo4j Community edition, version 1.6.M03
rake neo4j:start                             # Start Neo4j
rake neo4j:stop                              # Stop Neo4j
rake neo4j:restart                           # Restart Neo4j
rake neo4j:reset_yes_i_am_sure               # Wipe your Neo4j Database