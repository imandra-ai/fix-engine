IPL=../../ipl/

# Generate IPL
$IPL/ipl-standalone/venueGen.sh simple.ipl

mv fix-engine/src-model/ .

mv fix-engine/src-core-fresh/ .
mv fix-engine/src-core-time-defaults/ .
mv fix-engine/src-core-time-defaults-pp/ .
mv fix-engine/src-protocol-exts/ .
mv fix-engine/src-protocol-exts-pp/ .
mv fix-engine/src-simulation-utils-gen/ .


rm -rf reasoning
rm -rf xml_dict
rm -rf templates/

