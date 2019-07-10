# telemetry-pusher.sh
#
# Copyright 2018-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this
# software and associated documentation files (the "Software"), to deal in the Software
# without restriction, including without limitation the rights to use, copy, modify,
# merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Don't need to repeat unless coming back into a new terminal window since lab4
# CHANGE THIS LINE TO YOUR NAME AND FAV COLOR
THING_NAME=LastNameFavoriteColor

# get iot endpoint
IOT_ENDPOINT=$(jq -r .endpointAddress < endpoint-setup.out)


SCRIPT=~/environment/aws-iot-device-sdk-python/samples/basicPubSub/basicPubSub.py

python3 ${SCRIPT} -e $IOT_ENDPOINT -r ./root-ca.pem  -c ./service-certificate.pem  -k ./thing-private.key -id ${THING_NAME} -t '$aws/rules/BasicIngestRule' -m publish
