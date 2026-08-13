#!/bin/sh

README="316ctf/README.md"

# 各カテゴリの総数をあらかじめ定義
get_total() {
    case "$1" in
        "Password_Cracking") echo 27 ;;
        "Crypto") echo 100 ;;
        "Find_Stacy") echo 0 ;;
        "Network_Analysis") echo 0 ;;
        "OSINT") echo 0 ;;
        "Web") echo 0 ;;
        *) echo 0 ;;
    esac
}

for category_dir in 316ctf/*/; do
    [ -d "$category_dir" ] || continue
    
    category_name=$(basename "$category_dir")
    
    total=$(get_total "$category_name")
    [ "$total" -eq 0 ] && continue

    # 中に README.md があるフォルダの数（解いた数）をカウント
    solved=0
    for prob_dir in "$category_dir"/*/; do
        [ -d "$prob_dir" ] || continue
        if [ -f "${prob_dir}README.md" ]; then
            solved=$((solved + 1))
        fi
    done
    
    percent=$(( solved * 100 / total ))

    color="orange"
    [ "$percent" -eq 100 ] && color="brightgreen"

    badge_label=$(echo "$category_name" | sed 's/_/%20/g')
    new_badge="![${category_name}](https://img.shields.io/badge/${badge_label}-${solved}%2F${total}%20(${percent}%25)-${color}?style=flat-square)"

    if grep -q "badge/${badge_label}-" "$README" 2>/dev/null; then
        sed -i "s#\!\[${category_name}\](https://img.shields.io/badge/${badge_label}-.*)#${new_badge}#g" "$README"
    else
        echo "$new_badge" >> "$README"
    fi
done

git add .
git commit -m "update: auto-update 316ctf badges and writeups"
git push origin main
