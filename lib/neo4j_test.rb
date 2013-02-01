require 'rubygems'
require 'neography'
class Neo4jTest

  def self.create_person(name)
    @neo = Neography::Rest.new
    @neo.create_node("name" => name)
  end

  def self.make_mutual_friends(node1, node2)
    @neo = Neography::Rest.new
    @neo.create_relationship("friends", node1, node2)
    @neo.create_relationship("friends", node2, node1)
  end

  def self.suggestions_for(node)
    @neo = Neography::Rest.new
    @neo.traverse(node,
      "nodes", 
      {"order" => "breadth first", 
       "uniqueness" => "node global", 
       "relationships" => {"type"=> "friends", 
         "direction" => "in"}, 
         "return filter" => {"language" => "javascript",
           "body" => "position.length() == 2;"},
           "depth" => 2}).map{|n| n["data"]["name"]}.join(', ')
  end

  #johnathan = create_person('Johnathan')
  #mark      = create_person('Mark')
  #phil      = create_person('Phil')
  #mary      = create_person('Mary')
  #luke      = create_person('Luke')

  #make_mutual_friends(johnathan, mark)
  #make_mutual_friends(mark, mary)
  #make_mutual_friends(mark, phil)
  #make_mutual_friends(phil, mary)
  #make_mutual_friends(phil, luke)

  #puts "Johnathan should become friends with #{suggestions_for(johnathan)}"

# RESULT
# Johnathan should become friends with Mary, Phil

end