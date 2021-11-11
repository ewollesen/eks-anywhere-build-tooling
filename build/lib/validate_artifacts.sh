#!/usr/bin/env bash
# Copyright Amazon.com Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

PROJECT_ROOT="$1"
ARTIFACTS_FOLDER="$2"
GIT_TAG="$3"

PROJECT_NAME=$(basename $PROJECT_ROOT)
rm -f /tmp/actual-$PROJECT_NAME-files
for file in $(find ${ARTIFACTS_FOLDER} -type f | sort); do
    filepath=$(realpath --relative-base=$ARTIFACTS_FOLDER $file)
	echo $filepath >> /tmp/actual-$PROJECT_NAME-files
done

export GIT_TAG=$GIT_TAG
envsubst '$GIT_TAG' \
	< $PROJECT_ROOT/expected_artifacts \
	> /tmp/expected-$PROJECT_NAME-files


if ! diff /tmp/expected-$PROJECT_NAME-files /tmp/actual-$PROJECT_NAME-files; then
	echo "Artifacts directory does not matched expected!"
	echo "******************* Actual ******************"
	cat /tmp/actual-$PROJECT_NAME-files
	echo "*********************************************"
	exit 1
fi
