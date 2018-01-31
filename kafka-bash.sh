#!/bin/bash
#
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


function __kafka_acls_sh () {
    local base_ops="--add|--allow-host|--allow-principal|--authorizer|--authorizer-properties|--cluster|--consumer|--deny-host|--deny-principal|--force|--group|--help|--list|--operation|--producer|--remove|--topic"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )

}


# For Kafka 1.0

function __kafka_configs_sh () {
    local base_ops="--add-config|--alter|--delete-config|--describe|--entity-default|--entity-name|--entity-type|--force|--help|--zookeeper"
    local base_config_ops="cleanup.policy|compression.type|delete.retention.ms|file.delete.delay.ms|flush.messages|flush.ms|follower.replication.throttled.replicas|index.interval.bytes|leader.replication.throttled.replicas|max.message.bytes|message.format.version|message.timestamp.difference.max.ms|message.timestamp.type|min.cleanable.dirty.ratio|min.compaction.lag.ms|min.insync.replicas|preallocate|retention.bytes|retention.ms|segment.bytes|segment.index.bytes|segment.jitter.ms|segment.ms|unclean.leader.election.enable|follower.replication.throttled.rate|leader.replication.throttled.rate|request_percentage|producer_byte_rate|SCRAM-SHA-256|SCRAM-SHA-512|consumer_byte_rate|request_percentage|producer_byte_rate|consumer_byte_rate"

    local cur=${COMP_WORDS[COMP_CWORD]}

    if [ "X$3" != "X--help" ] ; then
        COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
    else
        COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_config_ops" -- $cur ) )
    fi

}

# For Kafka 1.0

function __kafka_console_consumer_sh () {

    local base_ops="--blacklist|--bootstrap-server|--consumer-property|--consumer.config|--csv-reporter-enabled |--delete-consumer-offsets|--enable-systest-events|--formatter|--from-beginning|--group|--isolation-level|--key-deserializer|--max-messages|--metrics-dir|--new-consumer|--offset|--partition |--property|--skip-message-on-error|--timeout-ms|--topic|--value-deserializer|--whitelist|--zookeeper"
    local isolation_level_ops="read_uncommited|read_commited"
    local offset_ops="latest|earliest"

    local cur=${COMP_WORDS[COMP_CWORD]}

    case "X$3" in 
        "X--isolation-level")
        COMPREPLY=($(IFS='|' compgen -S ' ' -W "$isolation_level_ops" -- $cur ) )
        ;;

        "X--offset")
        COMPREPLY=($(IFS='|' compgen -S ' ' -W "$offset_ops" -- $cur ) )
        ;;

        *)
        COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
        ;;

    esac
}

# For Kafka 1.0

function __kafka_console_producer_sh () {

    local base_ops="--batch-size|--broker-list|--compression-codec|--key-serializer|--line-reader|--max-block-ms|--max-memory-bytes|--max-partition-memory-bytes|--message-send-max-retries|--metadata-expiry-ms|--old-producer|--producer-property--producer.config|--property|--queue-enqueuetimeout-ms|--queue-size|--request-required-acks|--request-timeout-ms|--retry-backoff-ms|--socket-buffer-size|--sync|--timeout|--topic|--value-serializer"
    local compression_ops="gzip|snappy|lz4|none"
    local cur=${COMP_WORDS[COMP_CWORD]}

    if [ "X$3" == "X--compression-codec" ] ; then
        COMPREPLY=($(IFS='|' compgen -S ' ' -W "$compression_ops" -- $cur ) )
    else
        COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
    fi

} 

# For Kafka 1.0

function __kakfa_mirror_maker_sh () {

    local base_ops="--abort.on.send.failure|--blacklist|--consumer.config|--consumer.rebalance.listener|--help|--message.handler|--message.handler.args|--new.consumer|--num.streams|--offset.commit.interval.ms |--producer.config|--rebalance.listener.args|--whitelist"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )

}

# For Kafka 1.0

function __kafka_server_start_sh () {
    # ToDo --override add property=value ;-)
    local base_ops="--daemon|--override"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
}


# For Kafka 1.0

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


# Apply bash completions
# If you don't need a completion (for whatever reason), just comment the line here.

complete -A alias -F __kafka_acls_sh kafka-acls.sh
complete -A alias -F __kafka_configs_sh kafka-configs.sh
complete -A alias -F __kafka_console_consumer_sh kafka-console-consumer.sh
complete -A alias -F __kafka_console_producer_sh kafka-console-producer.sh
complete -A alias -F __kakfa_mirror_maker_sh kafka-mirror-maker.sh
complete -A alias -F __kakfa_server_start_sh kafka-server-start.sh
complete -A alias -F __kafka_topics_sh kafka-topics.sh

#EOF#