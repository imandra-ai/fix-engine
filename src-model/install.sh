rm -rf ../src-protocol-exts*
rm -rf src*
mv ./fix-venue-model/src-protocol-exts* ..
mv ./fix-venue-model/src* .
rm -rf fix-venue-model/



git checkout -- src-types-pp/json_to_action.ml

