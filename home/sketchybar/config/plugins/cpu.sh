#!/usr/bin/env zsh

MACMON_OUTPUT=$(macmon pipe --samples 1 --interval 500 2>/dev/null)

if [[ -n "$MACMON_OUTPUT" ]]; then
    PERFORMANCE_CORES=$(sysctl -n hw.perflevel0.physicalcpu 2>/dev/null || echo 1)
    EFFICIENCY_CORES=$(sysctl -n hw.perflevel1.physicalcpu 2>/dev/null || echo 1)

    METRICS=$(jq -r \
        --argjson performance_cores "$PERFORMANCE_CORES" \
        --argjson efficiency_cores "$EFFICIENCY_CORES" \
        '
        (.temp.cpu_temp_avg | round) as $temperature |
        (
            if .cpu_usage_pct then
                .cpu_usage_pct * 100
            else
                (
                    (.pcpu_usage[1] * $performance_cores) +
                    (.ecpu_usage[1] * $efficiency_cores)
                ) / ($performance_cores + $efficiency_cores) * 100
            end
        ) | "\($temperature)°C\t\(round)%"
        ' <<< "$MACMON_OUTPUT" 2>/dev/null)
fi

if [[ -n "$METRICS" ]]; then
    IFS=$'\t' read -r TEMPERATURE CPU_USAGE <<< "$METRICS"
    LABEL="$TEMPERATURE  $CPU_USAGE"
else
    LABEL="CPU unavailable"
fi

sketchybar --set "$NAME" label="$LABEL"
