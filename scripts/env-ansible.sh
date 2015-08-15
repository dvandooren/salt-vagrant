#!/usr/bin/env bash
#
# Wrapper tool to ease the use of ansible with multiple variable files for different projects
#
# This script should be run from the main project dir (ie. the dir that has the playbooks and the envs dir under it)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${PATH}"

if [ $# -lt 1 ]; then
	echo "Usage: $0 <PROJECT>"
	echo
	echo "You must specify the project name to load the inventory and variable files for."
	echo "     ie. $0 sample"
	echo
	echo "The variable files must be named <PROJECT>.config and <PROJECT>.secret"
	echo "The inventory file must be named <PROJECT>.hosts"
	exit 1
fi

function info() {
    echo -e "\033[0;35m${*}\033[0m"
}

# Discover the variable files.
VARS="-e @envs/$1.config -e @envs/$1.secret"
INV="-i envs/$1.hosts"

# Shift the command line varibles to pass along to ansible-playbook
shift

# Provide information on the discovered variables.
info "Variable files: \"${VARS}\""
info "Inventory file: \"${INV}\""

# Run the ansible playbook command.
$(which time) "$(which ansible-playbook)" ${INV} ${VARS} "$@"
