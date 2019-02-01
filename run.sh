#!/bin/sh


# unzip vendor.zip
# if [[ ! -e .bundle ]]; then
#             mkdir .bundle
# fi


#This block is used for machine details from environment variable
IFS=$';' GLOBIGNORE='*' command eval  'IPs=($IPS)'
for i in "${IPs[@]}"
do
        echo $i
        str=$i
        IFS=':' read -ra ary <<< "$str"

        echo ${ary[0]}
        echo ${ary[1]}
        echo ${ary[2]}
        echo ${ary[3]}
        export SPEC_AUTHENTICATION=${ary[0]}
        export SPEC_IP=${ary[1]}
        export SPEC_USER=${ary[2]}
        export SPEC_PASSWORD=${ary[3]}
        export SPEC_HOST_AUTHENTICATION="$SPEC_AUTHENTICATION"
        export SPEC_HOST_NAME="$SPEC_IP"
        # export HOST_ROLE="$ROLE"

        # replace=' '
        # IFS='+' read -ra roleary <<< "$ROLE"
        # for role in "${roleary[@]}"
        # do
            # export ROLE=${role}
            # TITLE1=$(echo "${ROLE}" | sed "s/_/${replace}/")
            # TITLE2=$(echo "${TITLE1^^} REPORT" )
            # export TITLE=$TITLE2

            if [ "${SPEC_AUTHENTICATION}" = "key" ]
            then
            mkdir "key"
            touch "key/${SPEC_USER}_${SPEC_IP}.key"
            echo -e "${SPEC_PASSWORD}" > "key/${SPEC_USER}_${SPEC_IP}.key"
            chmod 400 key/${SPEC_USER}_${SPEC_IP}.key
            fi

            bundle install && inspec exec . -t ssh://${SPEC_USER}@${SPEC_IP} --key-files key/${SPEC_USER}_${SPEC_IP}.key --format json-rspec >> reports/results.json && inspec exec . -t ssh://${SPEC_USER}@${SPEC_IP} --key-files key/${SPEC_USER}_${SPEC_IP}.key --format html >> report/results.html #--reporter json:./inspec_report.json html:./inspec_report.html #  bundle exec rake spec:"$HOST_ROLE" TITLE="${TITLE}"
            testExit=$?
            echo "-------------"
            # echo ${TITLE}
            echo "-------------"
            echo "********************************************************************************************"
            echo "* Report for this execution has been created in Reports folder as 'inspec_report.html' *"
            echo "********************************************************************************************"

        #    count_arr["${int}"]=$!
        #    int=$((int+1))
        # done

done

# for ip_pid in "${count_arr[@]}"
# do
# 	echo $ip_pid
# 	count=`ps -eaf | grep $ip_pid | grep -v grep | wc -l`

# 	while [ "$count" -gt 0 ]
# 	do
# 		sleep 5
# 		count=`ps -eaf | grep $ip_pid | grep -v grep | wc -l`
# 	done
# done
exit ${testExit}


