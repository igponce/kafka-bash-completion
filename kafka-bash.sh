# Kafka Bash Completion
# (c) 2017 Iñigo Gonzalez Ponce
# This is unreleased propietary software (by now)

# We have one function for every command that provides autocompletion.
# The function that configures autocompletion has the same name of the
# command preceded by __ (double underscore)

function __kafka_topics_sh () {

    
    local base_topics_ops="--topic|--alter|--zookeeper|--config"

    local cur=${COMP_WORDS[COMP_CWORD]}

	COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_topics_ops" -- $cur ) )

}

complete -A alias -F __kafka_topics_sh kafka-topics.sh
