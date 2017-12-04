# Kafka Bash Completion
# (c) 2017 Iñigo Gonzalez Ponce
# This is unreleased propietary software (by now)
#
# We have one function for every command that provides autocompletion.
# The function that configures autocompletion has the same name of the
# command preceded by __ (double underscore)
function __kafka_topics_sh () {

    
    local base_topics_ops="--alter|--config|--create|--delete|--delete-config|--config|--describe|--disable-rack-aware|--force|--help|--if-exists|--if-not-exists|--list|--partitions|--replica-assignment|--replication-factor|--topic|--create|--topics-with-overrides|--unavailable-partitions|--under-replicated-partitions|--zookeeper"
    local topic_configs="cleanup.policy|compression.type|delete.retention.ms|file.delete.delay.ms|flush.messages|flush.ms|follower.replication.throttled.replicas|index.interval.bytes|leader.replication.throttled.replicas|max.message.bytes|message.format.version|message.timestamp.difference.max.ms|message.timestamp.type|min.cleanable.dirty.ratio|min.compaction.lag.ms|min.insync.replicas|preallocate|retention.bytes|retention.ms|segment.bytes|segment.index.bytes|segment.jitter.ms|segment.ms|unclean.leader.election.enable"
    
    local cur=${COMP_WORDS[COMP_CWORD]}

    if [ "X$3" == "X--config" ] ; then
        COMPREPLY=($(IFS='|' compgen -S ' ' -W "$topic_configs" -- $cur ) )
    else
        COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_topics_ops" -- $cur ) )
    fi

}

complete -A alias -F __kafka_topics_sh kafka-topics.sh
