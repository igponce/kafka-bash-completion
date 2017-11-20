# Kafka Bash Completion
# (c) 2017 Iñigo Gonzalez Ponce
# This is unreleased propietary software (by now)

# We have one function for every command that provides autocompletion.
# The function that configures autocompletion has the same name of the
# command preceded by __ (double underscore)

function __kafka_topics_sh () {

   echo '--topic'
   echo '--zookeeper'
   echo '--alter'
   echo '--config'


}

complete -F __kafka_topics_sh kafka-topics.sh
