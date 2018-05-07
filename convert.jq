#!/usr/bin/env jq -rf
. as $source |
def round:
	(. - 0.5) | floor + 1;
def float_to_cterm:
	. * 255 | if . < 75 then 0 else (. - 95)/40 | round + 1 end;
def rgb_to_cterm:
	split(" ") | 16 + 6*6*(.[0] | tonumber | float_to_cterm) + 6*(.[1] | tonumber | float_to_cterm) + (.[2] | tonumber | float_to_cterm);
def xc_get_color:
	split("/") as $path | $source | getpath($path);
$mapping | to_entries | map(. + (.key | split(":") | {group:.[0],target:.[1]})) | group_by(.group) | map("hi " + .[0].group + (map(" cterm\(.target)=\(.value | xc_get_color | rgb_to_cterm)") | join(""))) | .[]
