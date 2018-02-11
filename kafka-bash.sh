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


function __connect_distributed_standalone () {
    local base_ops="-daemon"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )

}

# For Kafka 1.0
function __kafka_acls_sh () {
    local base_ops="--add|--allow-host|--allow-principal|--authorizer|--authorizer-properties|--cluster|--consumer|--deny-host|--deny-principal|--force|--group|--help|--list|--operation|--producer|--remove|--topic"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
}

# For Kafka 1.0

function __kafka_broker_api_version () {
    local base_ops="--bootstrap-server|--command-config"
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

function __kafka_consumer_groups_sh () {

    local base_ops="--all-topics |--bootstrap-server|--by-duration|--command-config|--delete|--execute|--export|--from-file|--group|--list|--new-consumer|--reset-offsets|--shift-by|--timeout|--to-current|--to-datetime|--to-earliest|--to-latest|--to-offset|--topic|--zookeeper"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )

}

# For Kafka 1.0

function __kafka_consumer_perf_test_sh () {

    local base_ops="--broker-list|--consumer.config|--date-format|--fetch-size|--from-latest|--group|--help|--hide-header|--messages|--new-consumer|--num-fetch-threads|--print-metrics|--reporting-interval|--show-detailed-stats|--socket-buffer-size|--threads|--topic|--zookeeper"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
}

# For Kafka 1.0

function __kafka_delete_records_sh () {

    local base_ops="--bootstrap-server|--command-config|--offset-json-file"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )

}

# For Kafka 1.0

function __kakfa_log_dirs_sh () {

    local base_ops="--bootstrap-server|--broker-list|--describe|--topic-list"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )

}

# For Kafka 1.0

function __kakfa_mirror_maker_sh () {

    local base_ops="--abort.on.send.failure|--blacklist|--consumer.config|--consumer.rebalance.listener|--help|--message.handler|--message.handler.args|--new.consumer|--num.streams|--offset.commit.interval.ms |--producer.config|--rebalance.listener.args|--whitelist"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )

}

# For Kafka 1.0

function __kafka_producer_perf_test_sh () {

    local base_ops="--help|--num-records|--payload-delimiter|--payload-file|--print-metrics|--producer-props|--producer.config|--record-size|--throughput|--topic|--transaction-duration-ms|--transactional-id|-h"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
}

# For Kafka 1.0

function __kafka_reassing_partitions_sh () {

    local base_ops="--bootstrap-server|--broker-list|--disable-rack-aware|--execute|--generate|--reassignment-json-fil|--throttle|--timeout|--topics-to-move-json-file|--verify|--zookeeper"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
}


# For Kafka 1.0

function __kafka_replay_log_producer_sh () {

    local base_ops="--broker-list|--inputtopic|--messages|--outputtopic|--property|--reporting-interval|--sync|--threads|--zookeeper"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
}

# For Kafka 1.0

function __kafka_replica_verification_sh () {

    local base_ops="--broker-list|--fetch-size|--max-wait-ms|--report-interval-ms|--time|--topic-white-list"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
}

# For Kafka 1.0

function __kafka_run_class_sh () {

    local base_ops="-daemon|-name|-loggc"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
}


# For Kafka 1.0

function __kafka_server_start_sh () {

    local base_ops="--daemon|--override"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
}


# Working (@Kafka 1.0) will be dropped in a future release following 0.11.0.0.

function __kafka_simple_consumer_shell_sh () {

    local base_ops="--broker-list|--clientId|--fetchsize|--formatter|--max-messages|--max-wait-ms|--no-wait-at-logend|--offset|--partition|--print-offsets|--property|--replica|--skip-message-on-error|--topic"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
}

# For Kafka 1.0

function __kafka_streams_application_reset_sh () {

    local base_ops="--application-id|--bootstrap-servers|--config-file|--dry-run|--input-topics|--intermediate-topics|--zookeeper"
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

# For Kafka 1.0
function __kafka_verifiable_consumer_sh () {
    local base_ops = "--assignment-strategy|--broker-list|--consumer.config|--enable-autocommit|--group-id|--help|--max-messages|--reset-policy|--session-timeout|--topic|--verbose|-h|"
    local reset_policy_ops="earliest|latest|none"
    local assingment_strategy_ops="org.apache.kafka.clients.consumer.RoundRobinAssignor|org.apache.kafka.clients.consumer.RangeAssignor"


    case "X$3" in 
        "X--reset-policy")
        COMPREPLY=($(IFS='|' compgen -S ' ' -W "$reset_policy_ops" -- $cur ) )
        ;;

        "X--assignment-strategy")
        COMPREPLY=($(IFS='|' compgen -S ' ' -W "$assingment_strategy_ops" -- $cur ) )
        ;;

        *)
        COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )

        ;;
    esac
}

# For Kafka 1.0

function __kafka_verifiable_producer_sh () {
    local base_ops = "--acks|--broker-list|--max-messages|--message-create-time|--producer.config|--throughput|--topic|--value-prefix|-h"
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(IFS='|' compgen -S ' ' -W "$base_ops" -- $cur ) )
}



# Apply bash completions
# If you don't need a completion (for whatever reason), just comment the line here.

complete -A alias -F __connect_distributed_standalone connect-distributed.sh
complete -A alias -F __connect_distributed_standalone connect-standalone.sh

complete -A alias -F __kafka_acls_sh                kafka-acls.sh
complete -A alias -F __kafka_broker_api_version     kafka-broker-api-version.sh
complete -A alias -F __kafka_configs_sh             kafka-configs.sh
complete -A alias -F __kafka_consumer_perf_test_sh  kafka-consumer-perf-test.sh
complete -A alias -F __kafka_console_consumer_sh    kafka-console-consumer.sh
complete -A alias -F __kafka_console_producer_sh    kafka-console-producer.sh
complete -A alias -F __kafka_consumer_groups_sh     kafka-consumer-groups.sh
complete -A alias -F __kafka_delete_records_sh      kafka-delete-records.sh
complete -A alias -F __kakfa_log_dirs_sh            kafka-log-dirs.sh
complete -A alias -F __kakfa_mirror_maker_sh        kafka-mirror-maker.sh
complete -A alias -F __kafka_preferred_replica_election_sh kafka-preferred-replica-election.sh
complete -A alias -F __kafka_producer_perf_test_sh  kafka-producer-pref-test.sh
complete -A alias -F __kafka_reassing_partitions_sh kafka-reassing-partitions.sh
complete -A alias -F __kafka_replay_log_producer_sh kafka-replay-log-producer.sh
complete -A alias -F __kafka_replica_verification_sh kafka-replica-verification.sh
complete -A alias -F __kafka_run_class_sh           kafka-run-class.sh
complete -A alias -F __kakfa_server_start_sh        kafka-server-start.sh
complete -A alias -F __kafka_streams_application_reset_sh kafka-streams-application-reset.sh
complete -A alias -F __kafka_topics_sh              kafka-topics.sh
complete -A alias -F __kafka_verifiable_consumer_sh kafka-verifiable-consumer.sh
complete -A alias -F __kafka_verifiable_producer_sh kafka-verifiable-producer.sh

# Marked as deprecated from 0.11.0.0
complete -A alias -F __kafka_simple_consumer_shell_sh kafka-simple-consumer-shell.sh


#EOF#