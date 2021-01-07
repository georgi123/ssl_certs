#!/bin/bash
#Created by Georgi D
#to manipulate with datasteres


srckeystore=$3
dstkeystore=$2
cert=$3
alias=$4
case $1 in
  --list|-l)
    keytool -list -v -keystore ${dstkeystore} ;;
 --show|-s)
    openssl pkcs12 -in ${dstkeystore} -nodes ;;
 --import|-i)
   keytool -importkeystore \
     -srckeystore ${srckeystore} \
     -destkeystore ${dstkeystore} \
    -v ;;
 --iportcert|-ic)
    keytool -importcert -file ${cert} -keystore ${dstkeystore} -alias ${alias} ;;
 --exportcert|-ec)
    keytool -exportcert -keystore ${dstkeystore} -storetype PKCS12 -alias ${alias} -file ${cert} ;; 
  *)
   echo "use --list or -l to see keystore content"
   echo "use --show or -s to print keystore content" 
   echo "use --importcert or -ic to import certificate in datakeystore"
   echo "use --importcer or -ec to export certificate from datakeystore"
   echo "use --import or -i to import one keystore to the other";;
esac
