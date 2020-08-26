
#!/bin/sh

unzip vendor.zip
if [[ ! -e .bundle ]]; then
            mkdir .bundle
fi

#This block is used for machine details from file

#IFS=$'\n' GLOBIGNORE='*' command eval  'IPs=($(cat data/parameters.txt))'
#
#
#for i in "${IPs[@]}"
#do
#        str=$i
#        IFS=':' read -ra ary <<< "$str"
#
#        echo ${ary[0]}
#        echo ${ary[1]}
#        echo ${ary[2]}
#        echo ${ary[3]}
#        export SPEC_AUTHENTICATION=${ary[0]}
#        export SPEC_IP=${ary[1]}
#        export SPEC_USER=${ary[2]}
#        export SPEC_PASSWORD=${ary[3]}
#        nohup bash run_testnow_spec.sh  >> out.txt 2>&1 &
#
#done

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
        export HOST_ROLE="$ROLE"

        replace=' '
        IFS='+' read -ra roleary <<< "$ROLE"
        for role in "${roleary[@]}"
        do
            export ROLE=${role}
            TITLE1=$(echo "${ROLE}" | sed "s/_/${replace}/")
            TITLE2=$(echo "${TITLE1^^} REPORT" )
            export TITLE=$TITLE2

            if [ "${SPEC_AUTHENTICATION}" = "key" ]
            then
            mkdir "key"
            touch "key/${SPEC_USER}_${SPEC_IP}.key"
            echo -e "${SPEC_PASSWORD}" > "key/${SPEC_USER}_${SPEC_IP}.key"
            chmod 400 key/${SPEC_USER}_${SPEC_IP}.key
            fi

            inspec exec . -t ssh://${SPEC_USER}@${SPEC_HOST_NAME} --key-files key/${SPEC_USER}_${SPEC_IP}.key --format html >> reports/results.html
            inspec exec . -t ssh://${SPEC_USER}@${SPEC_HOST_NAME} --key-files key/${SPEC_USER}_${SPEC_IP}.key --format json-rspec >> reports/results.json

        #    bundle install --local && bundle exec rake spec:"$ROLE" TITLE="${TITLE}"
            testExit=$?
            echo "-------------"
            echo ${TITLE}
            echo "-------------"
            echo "********************************************************************************************"
            echo "* Report for this execution has been created in Reports folder as 'serverspec_report.html' *"
            echo "********************************************************************************************"

           count_arr["${int}"]=$!
           int=$((int+1))
        done

done

for ip_pid in "${count_arr[@]}"
do
	echo $ip_pid
	count=`ps -eaf | grep $ip_pid | grep -v grep | wc -l`

	while [ "$count" -gt 0 ]
	do
		sleep 5
		count=`ps -eaf | grep $ip_pid | grep -v grep | wc -l`
	done
done
exit ${testExit}








