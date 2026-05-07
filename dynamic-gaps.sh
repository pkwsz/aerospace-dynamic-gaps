gap=10
single_window_gap=1280

set_outer_gap() {
	local config_path=$(aerospace config --config-path)
	sed -i '' -E "s/^([[:space:]]*outer\.left[[:space:]]*=[[:space:]]*)[0-9]+/\1$1/" "$config_path"
	sed -i '' -E "s/^([[:space:]]*outer\.right[[:space:]]*=[[:space:]]*)[0-9]+/\1$1/" "$config_path"
}

resolution=(`system_profiler -json SPDisplaysDataType | grep '"_spdisplays_resolution"' | grep -oE '[0-9]+'`)
width=${resolution[0]}
height=${resolution[1]}
is_not_wide_enough=$(echo "$width / $height < 3.5" | bc -l)

if [ $is_not_wide_enough -eq 1 ]; then
	set_outer_gap "$gap"
	exit 0	
fi

window_count=$(aerospace list-windows --workspace focused | wc -l) 
if [ $window_count -gt 1 ]; then
	set_outer_gap "$gap"
else
	set_outer_gap "$single_window_gap"
fi

aerospace reload-config
