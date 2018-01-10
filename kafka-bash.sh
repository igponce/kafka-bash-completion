#!/bin/bash

# Kafka Bash Completion
# Copyright 2018 Iñigo Gonzalez Ponce
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


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

function __kakfa_server_start_sh () {
    # ToDo --override add property=value ;-)
    local base_ops="--daemon|--override"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
}

function __kakfa_mirror_maker_sh () {

    local base_ops="--abort.on.send.failure|--blacklist|--consumer.config|--consumer.rebalance.listener|--help|--message.handler|--message.handler.args|--new.consumer|--num.streams|--offset.commit.interval.ms |--producer.config|--rebalance.listener.args|--whitelist"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )

}
function __kafka_acls_sh () {
    local base_ops="--add|--allow-host|--allow-principal|--authorizer|--authorizer-properties|--cluster|--consumer|--deny-host|--deny-principal|--force|--group|--help|--list|--operation|--producer|--remove|--topic"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )

}

complete -A alias -F __kafka_topics_sh kafka-topics.sh
complete -A alias -F __kakfa_server_start_sh kafka-server-start.sh
complete -A alias -F __kakfa_mirror_maker_sh kafka-mirror-maker.sh
complete -A alias -F __kakfa_acls_sh kafka-acls.sh


